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
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მსუბუქი ავტომობილის მძღოლს უფლება აქვს მოძრაობა გააგრძელოს:", image: "5-1.jpg", answers: ["მხოლოდ A, C და D მიმართულებით","A, B, C და D მიმართულებით","მხოლოდ B და C მიმართულებით", "მხოლოდ D მიმართულებით"],isTrueIndex: 3))
        
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მსუბუქი ავტომობილის მძღოლს უფლება აქვს იმოძრაოს:", image: "5-2.jpg", answers: ["მხოლოდ A მიმართულებით","მხოლოდ B მიმართულებით","როგორც A, ასევე B მიმართულებით"],isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მოცემულ სიტუაციაში, მოსახვევს გაცდენილი ავტომობილის მძღოლს, მარჯვენა მოსახვევში შესვლის მიზნით:", image: "5-3.jpg", answers: ["უფლება აქვს მოაბრუნოს ავტომობილი A მიმართულებით","უფლება აქვს იმოძრაოს უკუსვლით B მიმართულებით","უფლება აქვს იმოძრაოს როგორც A, ასევე B მიმართულებით", "მოძრაობა ეკრძალება როგორც A, ასევე B მიმართულებით"],isTrueIndex: 3))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მოცემული საგზაო ნიშანი:", image: "5-4.jpg", answers: ["მოძრაობის ნებას რთავს მხოლოდ პირდაპირი მიმართულებით","აღნიშნავს გზას ან სავალ ნაწილს, რომელზედაც სატრანსპორტო საშუალებებით მოძრაობა მთელ სიგანეზე ხორციელდაბა ერთი მიმართულებით","კრძალავს სატრანსპორტო საშუალებების გაჩერებას და დგომას"],isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "რომელი ავტომობილის მძღოლი დაარღვევს საგზაო მოძრაობის წესებს ისრის მიმართულებით მოძრაობის შემთხვევაში, თუ ისინი შედიან ეზოს ტერიტორიაზე?", image: "5-5.jpg", answers: ["თეთრი ავტომობილის მძღოლი","ყვითელი ავტომობილის მძღოლი","ორივე ავტომობილის მძღოლი","არცერთი ავტომობილის მძღოლი"],isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მსუბუქი ავტომობილის მძღოლს მოძრაობის გაგრძელების უფლება აქვს:", image: "5-6.jpg", answers: ["მხოლოდ პირდაპირ და მარჯვნივ","მხოლოდ პირდაპირ და მარცხნივ","მხოლოდ პირდაპირ","ყველა მიმართულებით"], isTrueIndex: 1))
        
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მსუბუქი ავტომობილის მძღოლს მოძრაობის გააგრძელების უფლება აქვს:", image: "5-7.jpg", answers: ["მხოლოდ პირდაპირ","მხოლოდ მარჯვნივ","პირდაპირ და მარჯვნივ"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მსუბუქი ავტომობილის მძღოლს მოძრაობის გაგრძელების უფლება აქვს:", image: "5-8.jpg", answers: ["მხოლოდ მარცხნივ","მხოლოდ უკუმიმართულებით (მობრუნება)","მარცხნივ და უკუმიმართულებით (მობრუნება)"], isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "რომელი ავტომობილის მძღოლი არღვევს საგზაო მოძრაობის წესებს, თუ მწვანე ავტომობილი შედის ეზოში, ხოლო ყვითელი გაჩერებულია?", image: "5-9.jpg", answers: ["მხოლოდ მწვანე ავტომობილის მძღოლი","მხოლოდ ყვითელი ავტომობილის მძღოლი","ორივე ავტომობილის მძღოლი "], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic5, description: "მოცემულ სიტუაციაში, ეკრძალება თუ არა მსუბუქი ავტომობილის მძღოლს ისრის მიმართულებით მობრუნების მანევრის შესრულება?", image: "5-10.jpg", answers: ["ეკრძალება","არ ეკრძალება"], isTrueIndex: 1))
        
        /// --------- me6 daiwko ---------- \\\\\\\
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი ავტომობილის მძოლს ენიჭება უპირატესობა ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "6-1.jpg", answers: ["ლურჯი ავტომობილის მძღოლს", "თეთრი ავტომობილის მძღოლს"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "აქვს თუ არა წითელი ავტომობილის მძღოლს ისრის მიმართულებით მოძრაობის გაგრძელების უფლება, თუ შუქნიშნის მწვანე მაშუქი სიგნალის შემდეგ, ყვითელი მაშუქი სიგნალის ჩართვისას მას არ შეეძლო „სდექ“ ხაზთან გაჩერება მკვეთრი დამუხრუჭების გარეშე?", image: "6-2.jpg", answers: ["აქვს უფლება","არ აქვს უფლება"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი საგზაო მოძრაობის მონაწილეს მიმართ წარმოექმნება გზის დათმობის ვალდებულება წითელი ავტომობილის მძღოლს ისრის მიმართულებით მოძრაობის შემთხვევაში, თუ ოპერატიული სამსახურის ავტომობილს ჩართული აქვს ლურჯი მოელვარე სპეციალური ციმციმა და ხმოვანი სიგნალები?", image: "6-3.jpg", answers: ["ქვეითისა და ოპერატიული სამსახურის ავტომობილის მძღოლის მიმართ","მხოლოდ ოპერატიული სამსახურის ავტომობილის მძღოლის მიმართ","მხოლოდ ქვეითის მიმართ"], isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "ვალდებულია თუ არა მსუბუქი ავტომობილის მძღოლი გზა დაუთმოს ავტობუსის მძღოლს, რომელიც ამთავრებს გზაჯვარედინზე გადასვლას?", image: "6-4.jpg", answers: ["ვალდებულია","არ არის ვალდებული"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი ავტომობილის მძღოლს ეკრძალება ისრის მიმართულებით მოძრაობა შუქნიშნის ამ სიგნალზე, თუ გზაჯვარედინის შემდეგ სატრანსპორტო საშუალებებით ჩახერგილია სავალი ნაწილი?", image: "6-5.jpg", answers: ["მხოლოდ რუხი ავტომობილის მძღოლს","მხოლოდ ყვითელი ავტომობილის მძღოლს","არცერთი ავტომობილის მძღოლს", "ორივე ავტომობილის მძღოლს"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რა თანამიმდევრობით უნდა გაიარონ გზაჯვარედინი სატრანსპორტო საშუალებებმა ისრის მიმართულებით მოძრაობის შემთხვევაში, თუ შუქნიშანი გამორთულია?", image: "6-6.jpg", answers: ["ჯერ უნდა გაიაროს ავტობუსმა, შემდეგ - მსუბუქმა ავტომობილმა, შემდეგ - მოტოციკლმა, ბოლოს - ტრამვაიმ","ჯერ უნდა გაიაროს ტრამვაიმ, შემდეგ - მსუბუქმა ავტომობილმა, ბოლოს - ავტობუსმა და მოტოციკლმა","ჯერ უნდა გაიაროს მსუბუქმა ავტომობილმა, შემდეგ - ავტობუსმა, შემდეგ - ტრამვაიმ, ბოლოს - სატვირთო ავტომობილმა", "ჯერ უნდა გაიაროს მსუბუქმა ავტომობილმა, შემდეგ - ტრამვაიმ, ბოლოს - ავტობუსმა და მოტოციკლმა"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი სატრანსპორტო საშუალების მძღოლს წარმოექმნება გზის დათმობის ვალდებულება ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "6-7.jpg", answers: ["მსუბუქი ავტომობილის მძღოლს","ტრამვაის მძღოლს"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი სატრანსპორტო საშუალების მძღოლს წარმოექმნება გზის დათმობის ვალდებულება ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "6-8.jpg", answers: ["მსუბუქი ავტომობილის მძღოლს","ტრამვაის მძღოლს"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი სატრანსპორტო საშუალების მძღოლს წარმოექმნება გზის დათმობის ვალდებულება ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "6-9.jpg", answers: ["მსუბუქი ავტომობილის მძღოლს","ტრამვაის მძღოლს"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic6, description: "რომელი სატრანსპორტო საშუალების მძღოლის მიმართ წარმოექმნება გზის დათმობის ვალდებულება თეთრი ავტომობილის მძღოლს ისრის მიმართულებით მოძრაობის შემთხვევაში, თუ შუქნიშანში ჩართულია ყვითელი მოციმციმე მაშუქი სიგნალი?", image: "6-10.jpg", answers: ["მხოლოდ ტრამვაის მძღოლის მიმართ","მხოლოდ წითელი ავტომობილის მძღოლის მიმართ","როგორც ტრამვაის მძღოლის, ასევე წითელი ავტომობილის მძღოლის მიმართ"], isTrueIndex: 1))
        
        
        
        /// --------- me7 daiwko ---------- \\\\\\\
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "ვალდებულია თუ არა წითელი ავტომობილის მძღოლი, მიმდებარე ტერიტორიიდან გზაზე გასვლისას გზა დაუთმოს ქვეითებს?", image: "7-1.jpg", answers: ["ვალდებულია","არ არის ვალდებული"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "მსუბუქი ავტომობილის მძღოლს უფლება აქვს მობრუნების მანევრი შეასრულოს:", image: "7-2.jpg", answers: ["მხოლოდ A მიმართულებით", "მხოლოდ B მიმართულებით", "როგორც A, ასევე B მიმართულებით"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "რომელი ავტომობილის მძღოლს წარმოექმნება გზის დათმობის ვალდებულება ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "7-3.jpg", answers: ["შავი ავტომობილის მძღოლს", "წითელი ავტომობილის მძღოლს"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "მსუბუქი ავტომობილის მძღოლს მოძრაობა ეკრძალება:", image: "7-4.jpg", answers: ["A მიმართულებით", "B მიმართულებით", "C მიმართულებით"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "რომელი ავტომობილის მძღოლი დაარღვევს საგზაო მოძრაობის წესებს ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "7-5.jpg", answers: ["ყვითელი ავტომობილის მძღოლი","თეთრი ავტომობილის მძღოლი","წითელი ავტომობილის მძღოლი", "მწვანე ავტომობილის მძღოლი"], isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "რომელი ავტომობილის მძღოლს წარმოექმნება გზის დათმობის ვალდებულება ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "7-6.jpg", answers: ["ყვითელი ავტომობილის მძღოლს","თეთრი ავტომობილის მძღოლს"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "რომელი სატრანსპორტო საშუალების მძღოლის მიმართ წარმოექმნება გზის დათმობის ვალდებულება ტრაქტორის მძღოლს ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "7-7.jpg", answers: ["მხოლოდ მსუბუქი ავტომობილის მძღოლის მიმართ","მხოლოდ მეხრეს მიმართ","როგორც მსუბუქი ავტომობილის, ასევე მეხრეს მიმართ"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "რომელი ავტომობილის მძღოლს წარმოექმნება გზის დათმობის ვალდებულება ისრის მიმართულებით მოძრაობის შემთხვევაში?", image: "7-8.jpg", answers: ["თეთრი ავტომობილის მძღოლს","ლურჯი ავტომობილის მძღოლს"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "რომელი ავტომობილის მძღოლი დაარღვევს საგზაო მოძრაობის წესებს ისრის მიმართულებით მოძრაობის შემთხვევაში, თუ ავტობუსი მოძრაობს დადგენილი მარშრუტით?", image: "7-9.jpg", answers: ["მხოლოდ მსუბუქი ავტომობილის მძღოლი ","მხოლოდ ავტობუსის მძღოლი","არცერთი ავტომობილის მძღოლი", "ორივე ავტომობილის მძღოლი"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic7, description: "ისრის მიმართულებით მოძრავი რომელი სატრანსპორტო საშუალების მძღოლი არღვევს საგზაო მოძრაობის წესებს?", image: "7-10.jpg", answers: ["მხოლოდ ტრაქტორის მძღოლი","მხოლოდ \"CE\" კატეგორიის ავტომობილის მძღოლი","მხოლოდ ტრაქტორისა და \"CE\" კატეგორიის ავტომობილის მძღოლები", "მხოლოდ \"CE\" და \"B\" კატეგორიების ავტომობილების მძღოლები"], isTrueIndex: 3))
        
        /// --------- me8 daiwko ---------- \\\\\\\
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რომელი სატრანსპორტო საშუალების მძღოლი არღვევს საგზაო მოძრაობის წესებს, თუ ყველა სატრანსპორტო საშუალება მოძრაობს 100კმ/სთ სიჩქარით?", image: "8-1.jpg", answers: ["მხოლოდ სატვირთო ავტომობილის მძღოლი","მხოლოდ მწვანე ავტომობილის მძღოლი","მხოლოდ თეთრი მიკროავტობუსის მძღოლი", "მხოლოდ სატვირთო ავტომობილისა და თეთრი მიკროავტობუსის მძღოლები"], isTrueIndex: 3))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის უფლება აქვს „B“ კატეგორიის ავტომობილის მძღოლს გზის ამ მონაკვეთზე?", image: "8-2.jpg", answers: ["60 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით","90 კმ/სთ სიჩქარით", "110 კმ/სთ სიჩქარით"], isTrueIndex: 3))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "დაუსახლებულ პუნქტში, მოცემული საგზაო ნიშნის მოქმედების ზონაში, „B“ კატეგორიის ავტომობილის მძღოლს უფლება აქვს იმოძრაოს არა უმეტეს:", image: "8-3.jpg", answers: ["60 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით","90 კმ/სთ სიჩქარით", "110 კმ/სთ სიჩქარით"], isTrueIndex: 2))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის გაგრძელების უფლება აქვს მსუბუქმისაბმელიანი „B“ კატეგორიის ავტომობილის მძღოლს დასახლებული პუნქტის დასასრულის ამღვნიშვნელი საგზაო ნიშნის შემდეგ?", image: "8-4.jpg", answers: ["50 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით","90 კმ/სთ სიჩქარით", "110 კმ/სთ სიჩქარით"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის უფლება აქვს „B1“ კატეგორიის ავტომობილის მძღოლს დაუსახლებულ პუნქტში, გზის მოცემულ მონაკვეთზე?", image: "8-5.jpg", answers: ["60 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით","90 კმ/სთ სიჩქარით", "110 კმ/სთ სიჩქარით"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის უფლება აქვს მისაბმელიანი „BE“ კატეგორიის ავტომობილის მძღოლს დაუსახლებელ პუნქტში გზის ამ მონაკვეთზე?", image: "8-6.jpg", answers: ["60 კმ/სთ სიჩქარით","70 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით", "90 კმ/სთ სიჩქარით"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის უფლება აქვს „BE“ კატეგორიის ავტომობილის მძღოლს ავტომაგისტრალზე?", image: "8-7.jpg", answers: ["60 კმ/სთ სიჩქარით","70 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით", "90 კმ/სთ სიჩქარით"], isTrueIndex: 1))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რომელი სატრანსპორტო საშუალების მძღოლი არღვევს საგზაო მოძრაობის წესებს, თუ ყველა სატრანსპორტო საშუალება მოძრაობს 100 კმ/სთ სიჩქარით?", image: "8-8.jpg", answers: ["მხოლოდ მსუბუქი ავტომობილის მძღოლი","მხოლოდ მსუბუქი და სატვირთო ავტომობილის მძღოლები","მხოლოდ მსუბუქი ავტომობილისა და ავტობუსის მძღოლები", "მხოლოდ სატვირთო ავტომობილისა და ავტობუსის მძღოლები"], isTrueIndex: 3))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის გაგრძელების უფლება აქვს „B“ კატეგორიის მაბუქსირებელი ავტომობილის მძღოლს დასახლებულ პუნქტში, გზის ამ მონაკვეთზე?", image: "8-9.jpg", answers: ["50 კმ/სთ სიჩქარით","70 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით", "90 კმ/სთ სიჩქარით"], isTrueIndex: 0))
        
        DBHelper.getDBHelper().insertQuestion(prepareQuestion(topic8, description: "რა მაქსიმალური სიჩქარით მოძრაობის უფლება აქვს „B“ კატეგორიის ავტომობილის მძღოლს დაუსახლებელ პუნქტში, გზის მითითებულ მონაკვეთზე?", image: "8-10.jpg", answers: ["50 კმ/სთ სიჩქარით","70 კმ/სთ სიჩქარით","80 კმ/სთ სიჩქარით", "90 კმ/სთ სიჩქარით"], isTrueIndex: 3))
        
        print("morchaaa")
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