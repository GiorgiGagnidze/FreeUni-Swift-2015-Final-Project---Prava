//
//  GameController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class GameController: UITableViewController {
    
    var dbhelper : DBHelper = DBHelper.getDBHelper()
    
    var questions : [Question] = [Question]()
    
    let aspectFloatValue  = 100
    
    var counter : Int = 0

    var score : Int = 0
    
    var isClickable : Bool = true
    
    var wrongAnswer : String = ""
    
    var startTime = NSTimeInterval()
    
    var timer = NSTimer()
    
    var minutes : String = ""
    
    var seconds : String = ""
    
    var enteredFromGame : Bool = false

    @IBAction func onNextClick(sender: UIBarButtonItem) {
        if(counter < (questions.count - 1)){
            nextQuestion()
        } else {
            stop()
            let errors = dbhelper.selectErrorsWithQuestionsByUserID(1);
            for (_, element) in errors.enumerate() {
                print(element.toString())
            }
            print("minutes: " + minutes + " seconds: " + seconds)
        }
    }
    
    var currAnswer : String = ""
    
    var cell : UITableViewCell!
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var timerLabel: UILabel!
    enum Mention {
        
        case Question(text: String)
        case Answer(text: String)
        case Image(aspectRatio: CGFloat, imagePath: String)
    }
    
    func start() {
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
//        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
//        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        self.minutes = strMinutes
        self.seconds = strSeconds
        
        timerLabel.text = "\(strMinutes):\(strSeconds)"
        
    }
    
    class Section {
        var header: String = ""
        var cellID: String = ""
        var mentions: [Mention] = []
        
        func setHeader(headerNew: String) {
            self.header = headerNew
        }
        
        func setID(idNew: String){
            self.cellID = idNew
        }
        
        func setMentions (newMentions: [Mention]){
            self.mentions = newMentions
        }
        
    }
    
    var sections = [Section]()
    
    
    func setSectionItem(question: Question, header: String, id: String, mentionsNew: [Mention]) -> Section {
        let section =  Section()
        section.setHeader(header)
        section.setID(id)
        section.setMentions(mentionsNew)
        return section
    }
    
    
    var question: Question? {
        didSet {
            sections.removeAll()
            
            
            for ans in (question?.answers)! {
                print(ans.toString())
                if(ans.isTrue > 0){
                    currAnswer = ans.answer
                }
            }
            
            if question != nil {
                var mentions = [Mention]()
                mentions.insert(Mention.Image(aspectRatio: CGFloat(600/350) ,imagePath: ("/Users/kokotagauri/Desktop/untitled folder/FreeUni-Swift-2015-Final-Project---Prava/PravaProject/Images/"+(question?.image)!) ), atIndex: 0)
                
                let imageSection = setSectionItem(question!, header: "Image", id: "gameCell", mentionsNew: mentions)
                sections.append(imageSection)
            }
            
            if question != nil {
                var mentions = [Mention]()
                mentions.insert(Mention.Question(text: (question?.description)!), atIndex: 0)
                
                let imageSection = setSectionItem(question!, header: "Question", id: "questionCell", mentionsNew: mentions)
                sections.append(imageSection)
            }
            
            if question?.answers.count > 0 {
                
                let mentions : [Mention]
                mentions = question!.answers.map{ Mention.Answer(text: $0.answer) }
                
                let hashSection = setSectionItem(question!, header: "Answers", id: "answerCell", mentionsNew: mentions)
                
                sections.append(hashSection)
            }
            
            tableView.delegate = self
        }
    }
    
    
    
    
    func nextQuestion(){
        self.question = questions[counter]
        isClickable = true
        print(counter)
        counter += 1;
        
        self.tableView.reloadData()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.counter = 0
        
        if(enteredFromGame){
        
            start()
            
        }
        
        self.tableView.estimatedRowHeight = 50;
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        timerLabel.text = ""
        
        //questions = dbhelper.selectQuestions(10)
        
        self.question = questions[counter]
        
        counter += 1;
        
        
        //        self.ws.image = UIImage(contentsOfFile: "Images/" + questions[0].image)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].mentions.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }
    
    
    //    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //        switch sections[indexPath.section].mentions[indexPath.row] {
    //        case .Image(let aspectRatio,_):
    //            let height = ( tableView.bounds.width - CGFloat(aspectFloatValue) ) / aspectRatio
    //            return height
    //        default:
    //            return UITableViewAutomaticDimension
    //        }
    //    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch sections[indexPath.section].mentions[indexPath.row] {
        case .Image(let aspectRatio,_):
            let height = ( tableView.bounds.width - CGFloat(aspectFloatValue) ) / aspectRatio
            return height
            
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sections[indexPath.section].cellID, forIndexPath: indexPath)
        cell.textLabel?.textColor = UIColor.blackColor()
        switch sections[indexPath.section].mentions[indexPath.row] {
            
        case .Question(let question):
            cell.textLabel?.text = question
            cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            cell.textLabel?.numberOfLines = 0
            
            
            
        case .Answer(let answer):
            print("shemovidaaa")
            cell.textLabel?.text = answer
            if(answer == currAnswer){
                if(isClickable){
                    self.cell = cell
                } else {
                    cell.textLabel?.textColor = UIColor.greenColor()
                }
            } else if answer == wrongAnswer {
                if(!isClickable) {
                    cell.textLabel?.textColor = UIColor.redColor()
                }
            }
            cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            cell.textLabel?.numberOfLines = 0
            
            
        case .Image(_,let imagePath):
            if let imageCell = cell as? GameCell{
                imageCell.imagePath = imagePath
            }
        }
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            let row = sections[indexPath.section].mentions[indexPath.row]
            switch row {
            case .Answer(let answer):
                if(isClickable){
                if(currAnswer == answer){
                    score+=1
                } else {
                    
                        let error = Error()
                        error.question = question
                        let app = UIApplication.sharedApplication().delegate as! AppDelegate
                        error.user = app.user!
                        dbhelper.insertIntoErrors(error)
                        cell!.textLabel?.textColor = UIColor.redColor()
                        wrongAnswer = (cell?.textLabel?.text)!
                    
                }
                    self.cell.textLabel?.textColor = UIColor.greenColor()
                    
                    isClickable = false
                }
                //nextQuestion()
            default:
                break
            }
            
        
            
        
    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
}
