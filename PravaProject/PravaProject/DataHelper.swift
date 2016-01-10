//
//  DataHelper.swift
//  PravaProject
//
//  Created by Sandro on 1/10/16.
//  Copyright © 2016 FreeuniPravaTeam. All rights reserved.
//

import Foundation


public class DataHelper {
    
    
    static func insertData() {
        let topic1 = Topic()
        topic1.ID = 1
        topic1.topic = "მძღოლი, მგზავრი და ქვეითი"
        
        let topic2 = Topic()
        topic2.ID = 2
        topic2.topic = "გამაფრთხილებელი ნიშნები"
        
        let topic3 = Topic()
        topic3.ID = 3
        topic3.topic = "პრიორიტეტის ნიშნები"
        
        let topic4 = Topic()
        topic4.ID = 4
        topic4.topic = "ამკრძალავი ნიშნები"
        
        let topic5 = Topic()
        topic5.ID = 5
        topic5.topic = "მიმთითებელი ნიშნები"
        
        let topic6 = Topic()
        topic6.ID = 6
        topic6.topic = "შუქნიშნის სიგნალები"
        
        let topic7 = Topic()
        topic7.ID = 7
        topic7.topic = "მოძრაობა, მანევრირება, სავალი ნაწილი"
        
        let topic8 = Topic()
        topic8.ID = 8
        topic8.topic = "მოძრაობის სიჩქარე"
        
        DBHelper.getDBHelper().insertTopic(topic1)
        DBHelper.getDBHelper().insertTopic(topic2)
        DBHelper.getDBHelper().insertTopic(topic3)
        DBHelper.getDBHelper().insertTopic(topic4)
        DBHelper.getDBHelper().insertTopic(topic5)
        DBHelper.getDBHelper().insertTopic(topic6)
        DBHelper.getDBHelper().insertTopic(topic7)
        DBHelper.getDBHelper().insertTopic(topic8)
        
        
        // topic1
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "მოცემული საცნობი ნიშნებიდან რომელია საერთაშორისო მოძრაობაში მყოფი საქართველოში რეგისტრირებული სატრანსპორტო საშუალების მარეგისტრირებელი სახელმწიფოს განმასხვავებელი ნიშანი?", image: "1-1.jpg", answers: ["I","II","III"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რამდენი სავალი ნაწილი აქვს მოცემულ გზას?", image: "1-2.jpg", answers: ["ერთი","ორი","სამი","ოთხი"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რამდენი სავალი ნაწილი აქვს მოცემულ გზას?", image: "1-3.jpg", answers: ["ერთი","ორი","სამი"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რომელი საცნობი ნიშანი მაგრდება იმ მექანიკური სატრანსპორტო საშუალების უკანა მხარეს, რომელზედაც დამაგრებულია კოტებიანი სალტეები?", image: "1-4.jpg", answers: ["მხოლოდ III","მხოლოდ I","მხოლოდ II","სამივე"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რომელი საცნობი ნიშანი მაგრდება სახიფათო ტვირთის გადამზიდი სატრანსპორტო საშუალების წინა და უკანა მხარეს?", image: "1-5.jpg", answers: ["მხოლოდ III","მხოლოდ I","მხოლოდ II","მხოლოდ I და II"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რომელი საცნობი ნიშანი მაგრდება იმ მექანიკური სატრანსპორტო საშუალების წინა და უკანა მხარეს, რომელსაც სმენადაქვეითებული მძღოლი მართავს?", image: "1-6.jpg", answers: ["მხოლოდ III","მხოლოდ II","მხოლოდ I"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რომელი საცნობი ნიშანი მაგრდება მართვის სწავლებისათვის განკუთვნილი მექანიკური სატრანსპორტო საშუალების წინა და უკანა მხარეს?", image: "1-7.jpg", answers: ["მხოლოდ III","მხოლოდ II","მხოლოდ I"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "რომელი საცნობი ნიშანი მაგრდება იმ სატრანსპორტო საშუალებაზე, რომლის სიჩქარე ტვირთის გათვალისწინებით და ტექნიკური მახასიათებლებით კანონმდებლობით დადგენილზე ნაკლებია?", image: "1-8.jpg", answers: ["მხოლოდ III","მხოლოდ II","მხოლოდ I"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "მოცემული საგზაო ნიშანი იდგმება:", image: "1-9.jpg", answers: ["საპატრულო პოლიციის საგუშაგოებთან","საქართველოს ტერიტორიაზე, შემოსასვლელებში, საკონტროლო გამშვებ პუნქტებთან","ავტომაგისტრალის დასაწყისში"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic1, description: "მძღოლის სურვილისამებრ რომელი საცნობი ნიშანი შეიძლება დამაგრდეს იმ სატრანსპორტო საშუალებაზე, რომელსაც ექიმი მძღოლი მართავს?", image: "1-10.jpg", answers: ["მხოლოდ III","მხოლოდ II","მხოლოდ I"],isTrueIndex: 1))
        
        // topic2
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნების კომბინაციიდან რომელი იდგმება დაუსახლებელ პუნქტში, რკინიგზის უშლაგბაუმო გადასასვლელამდე 150-300 მეტრის მანძილზე, გზის მარცხენა მხარეს?", image: "2-1.jpg", answers: ["I","II","III","IV"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საცნობი ნიშნებიდან რომელია საავარიო გაჩერების ნიშანი?", image: "2-2.jpg", answers: ["I","II","III"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნებიდან რომელი აფრთხილებს შლაგბაუმიან რკინიგზის გადასასვლელთან მიახლოების თაობაზე?", image: "2-3.jpg", answers: ["I","II","III","IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნებიდან რომელი იდგმება განმეორებით დაუსახლებელ პუნქტში?", image: "2-4.jpg", answers: ["მხოლოდ I და II","მხოლოდ I და III","ყველა","მხოლოდ II და IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნებიდან რომელი იდგმება განმეორებით დაუსახლებელ პუნქტში?", image: "2-5.jpg", answers: ["მხოლოდ I და II","მხოლოდ II და III","ყველა","მხოლოდ II და IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "რომელი საგზაო ნიშანი აფრთხილებს უშლაგბაუმო რკინიგზის გადასასვლელთან მიახლოების თაობაზე?", image: "2-6.jpg", answers: ["მხოლოდ I","მხოლოდ II","მხოლოდ III","მხოლოდ III და IV"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნებიდან რომელი აფრთხილებს ორი ან მეტი ლიანდაგიანი რკინიგზის უშლაგბაუმო გადასასვლელთან მიახლოების შესახებ?", image: "2-7.jpg", answers: ["მხოლოდ I და II","ყველა","მხოლოდ II და III","მხოლოდ IV"],isTrueIndex: 3))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნები, 8.1.1 (მანძილი ობიექტამდე) დაფის გარეშე დაუსახლებელი პუნქტში სახიფათო მონაკვეთის დასაწყისამდე იდგმება:", image: "2-8.jpg", answers: ["500-100 მეტრის მანძილზე","100-150 მეტრის მანძილზე","150-300 მეტრის მანძილზე"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "მოცემული საგზაო ნიშნები დაუსახლებელ პუნქტში განმეორებით იდგმება სახიფათო მონაკვეთის დასაწყისამდე, არანაკლებ:", image: "2-9.jpg", answers: ["150 მეტრის მანძილზე","100 მეტრის მანძილზე","50 მეტრის მანძილზე"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic2, description: "შეიძლება თუ არა, მოცემული საგზაო ნიშნები, 8.1.1 მანძილი ობიექტამდე დაფის გარეშე, დაიდგას უშუალოდ აღმართის ან დაღმართის (ან დაღმართის და აღმართის) წინ, თუ ისინი ერთმანეთს მიჰყვება?", image: "2-10.jpg", answers: ["შეიძლება","არ შეიძლება"],isTrueIndex: 0))
        
        // topic3
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშანი:", image: "3-1.jpg", answers: ["აღნიშნავს გზას, რომელზედაც მოძრავ მძღოლს ენიჭება არარეგულირებული გზაჯვარედინის გავლის უპირატესობა","კრძალავს სახიფათო ტვირთის გადამზიდი ავტომობილების მოძრაობას","აღნიშნავს გზას, რომელზედაც მოძრავი მძღოლი ვალდებულია გზა დაუთმოს გადასაკვეთ გზაზე მოძრავ სატრანსპორტო საშუალებას"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშნებიდან რომელი აღნიშნავს გზის იმ მონაკვეთის ბოლოს, საიდანაც ის კარგავს მთავარი გზის სტატუსს?", image: "3-2.jpg", answers: ["I","II","III","IV"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშანი აღნიშნავს:", image: "3-3.jpg", answers: ["გზას, რომელზედაც მოძრავ მძღოლს ენიჭება არარეგულირებული გზაჯვარედინის გავლის უპირატესობა","გზის ვიწრო მონაკვეთს, რომელზედაც მოძრავ მძღოლს ენიჭება, უპირატესობა საპირისპირო მიმართულებით მოძრავ სატრანსპორტო საშუალებასთან შედარებით","გზის იმ მონაკვეთის ბოლოს, საიდანაც ის კარგავს მთავარი გზის სტატუსს"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშნებიდან რომელი აღნიშნავს ისეთ გზასთან გადაკვეთას, რომელზე მოძრავ მძღოლსაც აქვს გზის დათმობის ვალდებულება?", image: "3-4.jpg", answers: ["I","II","III","IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშნებიდან რომელი აღნიშნავს ისეთ გზასთან შეერთებას, რომელზე მოძრავ მძღოლსაც აქვს გზის დათმობის ვალდებულება?", image: "3-5.jpg", answers: ["მხოლოდ I და II","მხოლოდ I და III","ყველა","მხოლოდ II და IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშნებიდან რომელი აღნიშნავს ისეთ გზასთან შეერთებას, რომელზე მოძრავ მძღოლსაც აქვს გზის დათმობის ვალდებულება?", image: "3-6.jpg", answers: ["მხოლოდ I","მხოლოდ II","ყველა","მხოლოდ III და IV"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშნებიდან რომელი ავალდებულებს მძღოლს გზა დაუთმოს გადასაკვეთ გზაზე მოძრავ სატრანსპორტო საშუალების მძღოლს?", image: "3-7.jpg", answers: ["I","II","III","IV"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშანი:", image: "3-8.jpg", answers: ["უკრძლავს მძღოლს გზის ვიწრო მონაკვეთზე შესვლას","კრძალავს ყველა სახის სატრანსპორტო საშუალების მოძრაობას","ავალდებულებს მძღოლს გზა დაუთმოს გადასაკვეთ გზაზე მოძრავ სატრანსპორტო საშუალების მძღოლებს"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშნებიდან რომელი უკრძალავს მძღოლს სდექ ხაზის წინ გაუჩერებალად მოძრაობის გაგრძელებას?", image: "3-9.jpg", answers: ["I","II","III","IV"],isTrueIndex: 3))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic3, description: "მოცემული საგზაო ნიშანი:", image: "3-10.jpg", answers: ["კრძალავს ყველა სატრანსპორტო საშუალებით შესვლას მოცემული მიმართულებით","კრძალავს ნებისმიერი სახის სატრანსპორტო საშუალებით მოძრაობას","უკრძალავს მძღოლს მოძრაობის გაგრძელებას გაუჩერებალად, აგრეთვე ავალდებულებს მას გზა დაუთმოს გადასაკვეთ გზაზე მოძრავ სატრანსპორტო საშუალების მძღოლებს"],isTrueIndex: 2))
        
        //topic4
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემული საგზაო ნიშნის მოქმედების ზონაში მოპედითა და მასთან გათანაბრებული სატრანსპორტო საშუალებებით მოძრაობა ნებადართულია არაუმეტეს:", image: "4-1.jpg", answers: ["20 კმ/სთ","50 კმ/სთ","45 კმ/სთ"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემული საგზაო ნიშანი:", image: "4-2.jpg", answers: ["კრძალავს მოძრაობას ნიშანზე მითითებულზე მეტი სიჩქარით","აღნიშნავს მაქსიმალური სიჩქარის შემზღუდავი საგზაო ნიშნის მოქმედების ზონის დასასრულს","მიუთითებს სიჩქარეს, რომლითაც რეკომენდირებულია მოძრაობა გზის მოცემულ მონაკვეთზე"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "აქვს თუ არა მსუბუქი ავტომობილის მძღოლს, სურათზე მითითებულ ადგილას, ავტომობილის სადგომზე დაყენების უფლება, თვის ლუწ რიცხვებში 19.00 საათიდან 21.00 საათამდე?", image: "4-3.jpg", answers: ["აქვს უფლება","არ აქვს უფლება"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემულ სიტუაციაში, რომელი ავტომობილის მძღოლს არ ეკრძალება ისრის მიმართულებით მოძრაობა, თუ სატვირთო ავტომობილის ფაქტობრივი მასა 7 ტონაა?", image: "4-4.jpg", answers: ["მხოლოდ სატვირთო ავტომობილის მძღოლს","მხოლოდ წითელი მსუბუქი ავტომობილის მძღოლს","არცერთი ავტომობილის მძღოლს"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემული საგზაო ნიშანი:", image: "4-5.jpg", answers: ["უკრძალავს მძღოლს მოძრაობის გაგრძელებას გაუჩერებალად","კრძალავს სატრანსპორტო საშუალებების გაჩერებას და დგომას","კრძალავს ყველა სახის სატრანსპორტო საშუალებით მოძრაობას"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემული საგზაო ნიშნებიდან, რომლი კრძალავს მის მოქმედების ზონაში ყველა სახის მექანიკური სატრანსპორტო საშუალებით მოძრაობას?", image: "4-6.jpg", answers: ["მხოლოდ I","მხოლოდ II და IV","ყველა","მხოლოდ III და IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "დაარღვევს თუ არა შავი ავტომობილის მძღოლი საგზაო მოძრაობის წესებს ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "4-7.jpg", answers: ["დაარღვევს","არ დაარღვევს"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემულ სიტუაციაში, ეკრძალება თუ არა მძღოლს ისრით მითითებულ ადგილას ავტომობილის გაჩერება?", image: "4-8.jpg", answers: ["ეკრძალება","არ ეკრძალება"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემული საგზაო ნიშნებიდან რომლის მოქმედება ვრცელდება ნიშნის დადგმის ადგილიდან მის შემდეგ მდებარე უახლოეს გზაჯვარედინამდე, ხოლო დასახლებულ პუნქტში, თუ არ არის გზაჯვარედინი - დასახლებული პუნქტის ბოლომდე.", image: "4-9.jpg", answers: ["მხოლოდ I","მხოლოდ I, II და IV","ყველა","მხოლოდ III და IV"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic4, description: "მოცემული საგზაო ნიშნებიდან რომლის მოქმედება ვრცელდება სავალი ნაწილების იმ გადაკვეთაზე, რომლის წინაც დადგმულია ნიშანი?", image: "4-10.jpg", answers: ["მხოლოდ I","მხოლოდ I, III და IV","მხოლოდ III","მხოლოდ III და IV"],isTrueIndex: 1))
        
        
        print("davamate dedis mutelshi")
    }
    
    
    static private func prepareQuestion(topic: Topic, description: String,image: String,answers: [String],isTrueIndex: Int) -> Question
    {
        let question = Question()
        
        question.topic = topic
        question.description = description
        question.image = image
        
        for (index,element) in answers.enumerate() {
            let answer = Answer()
            answer.answer = element
            answer.isTrue = index == isTrueIndex ? 1 : 0
            question.answers.append(answer)
            
        }
        return question
    }
    
}