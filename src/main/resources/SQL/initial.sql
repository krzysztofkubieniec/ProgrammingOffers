INSERT INTO `category` VALUES (1,'','Strony internetowe'),(2,'','Serwisy, portale'),(3,'','Bazy danych'),(4,'','Grafika komputerowa'),(5,'','Pozycjonowanie stron');

INSERT INTO `role` VALUES (1,'Contractor with permission to add offers','contractor'),(2,'','admin');

INSERT INTO `user` VALUES (1,NULL,'2019-01-15 13:21:49','test@gmail.com',NULL,NULL,'test','$2a$10$Ggd5QfGXuOVG8qiSNQoSpebQYxzJEbwQsZ6iWxa/nj/ntBYQJOLLS',NULL),(2,NULL,'2019-01-15 13:21:49','test2@gmail.com',NULL,NULL,'test2','$2a$10$Ggd5QfGXuOVG8qiSNQoSpebQYxzJEbwQsZ6iWxa/nj/ntBYQJOLLS',NULL);

INSERT INTO `orders` VALUES (1,'test','2019-01-15 13:22:27','2019-04-24 00:00:00','test',1,NULL),(2,'test2','2019-01-15 13:22:39','2019-03-20 00:00:00','test2',1,NULL),(3,'aaaaaaaaaaaaaaaaaaa','2019-01-15 13:23:00','2019-03-28 00:00:00','aaaaaaaaaa',2,NULL);

INSERT INTO `orders_category` VALUES (1,1),(2,2),(2,3),(3,3),(3,4);