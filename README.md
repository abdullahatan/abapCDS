# CDS(Core Data Services)

SAP HANA' nın bize sunduğu avantajlardan biri de CDS'lerdir. CDS View'le SQL kullanılarak geliştirilen SAP’nin yeni bir programlama modelidir.
Teknik olarak ise; anlamlı ve zengin veritabanı birimlerini ve kullanıcı tanımlı veri modellerini tanımlamak için yeni bir Veri Tanımlama Dili (Data Definition Language(DDL)) 
sunan SQL tabanlı geliştirmedir. SAP bu yeni modele ‘Code-Pushdown’ ve ‘Code-To-Data’ isimlerini veriyor. Böyle isimlendirmesinin sebebi ise, veriye ulaşma ve onu hazır etme işlemlerini uygulama sunucusu üzerinde yapmaktansa, veritabanı seviyesine indirgemesi ve yükü veritabanına vermesidir. 
Eclipse ve Hana Studio ortamlarında geliştirme yapılabilir.

Avantajları;
Database tabanına direkt erişim sağladığı için kod ile sistem arasındaki geçimleri yavaşlatır. 
CDS kullanılarak görüntüleme, tablolalar, ek açıklamalar, kullanıcı tanımlı veri türleri ve bağlamlar oluşturabiliriz. 

### Örnek: Basit CDS View Oluşturma

![image](https://user-images.githubusercontent.com/26427511/145884694-5ddbb1de-65a1-4fee-9697-a64200c11373.png)

![image](https://user-images.githubusercontent.com/26427511/145952321-3eefc626-4fbc-4a80-9d0b-1b375aebcd0f.png)

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
CDS View'lere 'Güvenlik' parçası eklemek için kullanılır. CDS View'lerin dışarıya açmak istediğimizde verileri yetki bazında kısıtlamak önemli olabilir.Bu bölüme yetki nesneleri oluşturularak bağlanabilir ve yetkilendirme sağlanabilir.

##### @EndUserText.label: ‘CDS View type #BASIC’:
CDS View'ler üzerindeki 'Açıklama' kısmının tayini için kullanılır.

![image](https://user-images.githubusercontent.com/26427511/145891472-4b12639e-5d70-4d83-b022-4c36a29bd0ee.png)

![image](https://user-images.githubusercontent.com/26427511/145890633-f77b7381-f05d-4975-8891-c598cf423f09.png)

![image](https://user-images.githubusercontent.com/26427511/145890791-2e6d7f8f-73b5-40e0-82e8-4b1f7ea481db.png)

![image](https://user-images.githubusercontent.com/26427511/145891019-a1a6761e-6ab5-4533-83d8-d7b12e6ec09d.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_1.abap)
 
### Örnek: Mantıksal işlemler, SQL Built İfadeleri ve Sistem Değişkenleri Kullanılması

![image](https://user-images.githubusercontent.com/26427511/145997859-3ee4de29-c546-46bc-ae40-c6a80845de78.png)

![image](https://user-images.githubusercontent.com/26427511/145998985-b8adcd89-8142-46b8-8284-2b8a40a9a09e.png)

![image](https://user-images.githubusercontent.com/26427511/145999396-4ed51db0-8699-409a-99ca-f19f747c63c0.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_2.abap)
 
 



