# CDS_VIEW

SAP HANA' nın bize sunduğu avantajlardan biri de CDS'lerdir. CDS View'le SQL kullanılarak geliştirilen SAP’nin yeni programlama bir modelidir.
Teknik olarak ise; anlamlı ve zengin veritabanı birimlerini ve kullanıcı tanımlı veri modellerini tanımlamak için yeni bir Veri Tanımlama Dili (Data Definition Language(DDL)) 
sunan SQL tabanlı geliştirmedir. SAP bu yeni modele ‘Code-Pushdown’ ve ‘Code-To-Data’ isimlerini veriyor. Böyle isimlendirmesinin sebebi ise, veriye ulaşma ve onu hazır etme işlemlerini uygulama sunucusu üzerinde yapmaktansa, veritabanı seviyesine indirgemesi ve yükü veritabanına vermesidir. 
Eclipse ve Hana Studio ortamlarında geliştirme yapılabilir.

Avantajları;
Database tabanına direkt erişim sağladığı için kod ile sistem arasındaki geçimleri yavaşlatır. 
CDS kullanılarak görüntüleme, tablolalar, ek açıklamalar, kullanıcı tanımlı veri türleri ve bağlamlar oluşturabiliriz. 


 ![image](https://user-images.githubusercontent.com/26427511/145884694-5ddbb1de-65a1-4fee-9697-a64200c11373.png)

 ![image](https://user-images.githubusercontent.com/26427511/145884913-b6c84be6-2151-42d1-ae8d-7c3ceb5c85da.png)
 
 ![image](https://user-images.githubusercontent.com/26427511/145885156-082d6450-cc31-4d3c-8125-968dedfb93d6.png)

![image](https://user-images.githubusercontent.com/26427511/145885910-c97989b2-799f-4f60-9d4f-26309c01a7c1.png)

#### Ek Açıklamalar:

##### @AbapCatalog.sqlViewName: ‘sql_view_name’: 
SQL görünüm adıdır, SE11'de görülebilen DDIC SQL görünümüdür. SE11 görünüm adı sınırlamalarına göre maksimum 16 karakter uzunluğunda olabilir. 

##### @AbapCatalog.compiler.compareFilter: true:
Verileri filtreleme davranışını tanımlar, yani önce filtre koşullarını karşılaştırır ve eğer eşleşirlerse veriler getirilir. CDS görünümünde join koşulları varsa, bunlar yalnızca filtre koşulları eşleştirildikten sonra yürütülür. DDIC ise bu olay önce veriler alınır ve sonra filtrelenirse görüntülenir. Dolayısıyla, bu ek açıklamayı true olarak ayarlarsak, bu alanların önüne 'KEY' kelimesini ekleyerek CDS görünümünüzde KEY alan olarak tanımlamış oluruz ve  yalnızca DDIC SQL görünümünde KEY alanları oluşturabiliriz.

Bunu 'false' olarak ayarlarsak 'KEY' kelimesini alanın önüne eklemenize bakılmaksızın, DB tablosu KEY alanları CDS View'ler için de KEY alanlar olarak tanımlanacaktır.

##### @AbapCatalog.preserveKey: true:
SAP tarafında oluşturulan tüm DB tabloları üzende tanımlanmış KEY alanları vardır, CDS'ler ise her zaman SAP tarafındaki bu DB tablorı üzenden oluşturulur. DB tablolarında tanımlanmış birden fazla KEY alan olabilir ve bu KEY alanların oluşturduğumuz CSD View'lerin KEY alanları olmasını isteyebiliriz. 

##### @AccessControl.authorizationCheck: #NOT_REQUIRED:

##### @EndUserText.label: ‘CDS View type #BASIC’:





