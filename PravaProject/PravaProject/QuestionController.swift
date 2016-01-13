//
//  QuestionController.swift
//  PravaProject
//
//  Created by MAC  on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import UIKit

class QuestionController: UITableViewController {
    
    
    enum Mention {
        
        case Question(text: String)
        case Answer(text: String)
        case Image(aspectRatio: CGFloat, imagePath: String)
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
    
    var currAnswer : String = ""
    
    var cell : UITableViewCell!
    
    
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
                mentions.insert(Mention.Image(aspectRatio: CGFloat(600/350) ,imagePath: (question?.image)!), atIndex: 0)
                
                let imageSection = setSectionItem(question!, header: "Image", id: "imageCell", mentionsNew: mentions)
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 50;
        self.tableView.rowHeight = UITableViewAutomaticDimension
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
    
    let aspectFloatValue  = 100
    
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
                
                cell.textLabel?.textColor = UIColor.greenColor()
                
            }
            cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            cell.textLabel?.numberOfLines = 0
            
            
        case .Image(_,let imagePath):
            if let imageCell = cell as? ImageCell{
                imageCell.imagePath = imagePath
            }
        }
        
        
        return cell
    }
    
    
    
}
