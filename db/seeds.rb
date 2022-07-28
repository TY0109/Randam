# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)  

AdminUser.create(name: "管理者1",
                 email: "admin@email.com",
                 password: "password",
                )

user1 = User.create(name: "スタッフ１",
            email: "sample@email.com",
            password: "password",
            admin_user_id: 1,
            is_valid:true
           )

user2 = User.create(name: "スタッフ2", 
            email: "sample-1@email.com",
            password: "password",
            admin_user_id: 1,
            is_valid:true
           )

folder1 = Folder.create(name: "白チャートIA", 
                        admin_user_id: 1
                       )

# 各チャプター１枚ずつデフォルトの写真を生成(chapter1のみ、2枚)
question = Question.create(chapter: 1,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )

question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_1.png')),
                      filename: 'user_1.png'
                     )
                     
question = Question.create(chapter: 2,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )
        
question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_2.png')),
                      filename: 'user_2.png'
                     )

question = Question.create(chapter: 3,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )
     
question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_3.png')),
                      filename: 'user_3.png'
                     )

question = Question.create(chapter: 4,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                         )
  
question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_4.png')),
                      filename: 'user_4.png'
                     )

question = Question.create(chapter: 1,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )

question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_1.png')),
                      filename: 'user_1.png'
                     )


question = Question.create(chapter: 5,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )

question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_5.png')),
                      filename: 'user_5.png'
                     )
                  
question = Question.create(chapter: 6,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )
     
question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_6.png')),
                      filename: 'user_6.png'
                  )

question = Question.create(chapter: 7,
                           admin_user_id: 1,
                           user_id:1,
                           folder_in: "白チャートIA"
                          )
  
question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_7.png')),
                      filename: 'user_7.png'
                     )

question = Question.create(chapter: 8,
                           admin_user_id: 1,
                           user_id:1,
                          folder_in: "白チャートIA"
                          )

question.image.attach(io: File.open(Rails.root.join('./app/assets/images/user_8.png')),
                      filename: 'user_8.png'
                     )


                
folder2 = Folder.create(name: "白チャートIIB", 
                        admin_user_id: 1
                       )



puts("Created!")