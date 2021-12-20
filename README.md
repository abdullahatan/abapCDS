# CDS(Core Data Services)

SAP HANA' nın bize sunduğu avantajlardan biri de CDS'lerdir. CDS View'le SQL kullanılarak geliştirilen SAP’nin yeni bir programlama modelidir.
Teknik olarak ise; anlamlı ve zengin veritabanı birimlerini ve kullanıcı tanımlı veri modellerini tanımlamak için yeni bir Veri Tanımlama Dili (Data Definition Language(DDL)) 
sunan SQL tabanlı geliştirmedir. SAP bu yeni modele ‘Code-Pushdown’ ve ‘Code-To-Data’ isimlerini veriyor. Böyle isimlendirmesinin sebebi ise, veriye ulaşma ve onu hazır etme işlemlerini uygulama sunucusu üzerinde yapmaktansa, veritabanı seviyesine indirgemesi ve yükü veritabanına vermesidir. 
Eclipse ve Hana Studio ortamlarında geliştirme yapılabilir.

Avantajları;
Database tabanına direkt erişim sağladığı için kod ile sistem arasındaki geçimleri yavaşlatır. 
CDS kullanılarak görüntüleme, tablolalar, ek açıklamalar, kullanıcı tanımlı veri türleri ve bağlamlar oluşturabiliriz. 

#### Örnek: Basit CDS View Oluşturma

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
 
#### Örnek: Mantıksal işlemler, SQL Built İfadeleri ve Sistem Değişkenleri Kullanılması

![image](https://user-images.githubusercontent.com/26427511/145999657-c4e606ee-7476-4ff8-831a-8d84f941927b.png)

![image](https://user-images.githubusercontent.com/26427511/145998985-b8adcd89-8142-46b8-8284-2b8a40a9a09e.png)

![image](https://user-images.githubusercontent.com/26427511/145999396-4ed51db0-8699-409a-99ca-f19f747c63c0.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_2.abap)
 
### CDS View Extension
Bir projede binlerce CDS View yaratabiliriz. CDS Viewler sanal veri modelleri olduğundan bir proje veya bir nesne için oluşturulan CDS View'ler başka bir proje veya nesne içinde kullanma ihtiyacı oluşacaktır. Örneğin A Tablosunun 5 alanını kullanarak bir CDS View oluşturduğumuzu ve başka bir proje için yine A Tablosunsun 8 alanına ihtiyaç duyduğumuzu varsayalım, bu durumda baştan CDS View oluşturmak yerine 'Extend View' seçeneği ile sahip olduğumuz CDS View'e ihtiyaç duyduğumuz alanları dahil edebiliriz. Extend View'lere sadece alan eklenebilir ve 'WHERE' yan tümcesini kullanılamaz.

![image](https://user-images.githubusercontent.com/26427511/146031872-d4d08b17-472e-4c3c-91b3-9c8dc5b2285d.png)

![image](https://user-images.githubusercontent.com/26427511/146034039-e91b6604-8643-40b8-8b92-3a9703d2e13f.png)

![image](https://user-images.githubusercontent.com/26427511/146033921-1c0a826b-35c8-4b34-805c-5a698335fd57.png)

![image](https://user-images.githubusercontent.com/26427511/146034504-257e2a27-d520-4e79-9c0f-98d0007e3322.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_3.abap)

### CDS View With Parameters
CDS View' lerde veri fitrelemek için 'WHERE' yan tümcesini kullanabiliriz. Statik koşulların yanı sıra kullanıcı etkileşimi gerektiren durumlarda ise 'Parameters' özelliği ile veri fitrelemesi yapmak mümkündür. 

![image](https://user-images.githubusercontent.com/26427511/146036782-af2d0c7a-b638-4fcb-8bde-8150049d27b3.png)

![image](https://user-images.githubusercontent.com/26427511/146037887-101755c5-a0d1-4577-956f-78f53c11645c.png)

![image](https://user-images.githubusercontent.com/26427511/146038082-0fc6052c-7877-4b9d-b0f9-52d3b8000cb2.png)

![image](https://user-images.githubusercontent.com/26427511/146038265-152b3909-a28c-4c9e-83f7-a915614cbb5b.png)

![image](https://user-images.githubusercontent.com/26427511/146039593-d1bbeafa-ab4f-4bc3-819e-a3953eae4ab2.png)

![image](https://user-images.githubusercontent.com/26427511/146039431-6f264e02-ed53-4b99-98d6-61a21f4d89e2.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_4.abap)

### CDS Views – Joins and Associations
CDS View'ler bir SQL geliştirmesi olup, projelerde verileri anlamlı bir bilgiye dönüştürmek için birden fazla tabloyu birleştirmemiz gerekebilir.  

#### JOINS:
CDS View'ler oluştururken aşağıdaki join türleri kullanılabilir.
 - Inner Join
 - Left Outer join
 - Right outer join


![image](https://user-images.githubusercontent.com/26427511/146067874-c3875496-d24e-4589-9751-e2fc29ce9488.png)

![image](https://user-images.githubusercontent.com/26427511/146069096-09efcee8-2f22-4201-921d-b471e243f581.png)

![image](https://user-images.githubusercontent.com/26427511/146069213-0ee063f6-efa1-409e-9990-ed4ccbe026f0.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_5.abap)


#### ASSOCIATIONS:
CDS View'lere iş kullanıcılar tarafından doğrudan erişilmez, bunun yerine ABAP programı, Fiori uygulamaları vb. araçlar üzerinden erişim sağlarlar. 5 farklı tablo JOIN ile bir CDS View oluşturduysak, JOIN koşulları CDS View her tetiklendiğinde yürütülecektir. İş kullanıcısı yalnızca 2 tablodaki alanlara bakıyor olsa bile CDS View önce 5 tablonun tümünün birleştirme koşullarını çalıştıracak ve kullanıcının kaç alana baktığını önemsemeyecektir. Bu yaklaşım Join SQL konseptidir ve bu konsept veri listeleme performansına neden olacaktır. Bu sorunun üstesinden gelmek için SAP, SQL veri alma yönteminde bir iyileştirmeye gitti ve 'ASSOCIATIONS' kavramınını geliştirdi. Association'lar ile veriler yalnızca kullanıcı onu görmek istediğinde alınır, kullanıcı görmek istemiyorsa veriye erişim olmaz. Örneğin, CDS View'lerde yapılandırılmış 4 İlişki var ve kullanıcı yalnızca 2 tablo için veri alıyor, diğer 2 tablodaki ASSOCIATION tetiklenmeyecek ve sistem sonuçları hızlı bir şekilde döndürecek. İki çeşit Association türü vardı. Bunlar Ad-Hoc ve Exposed Association olarak adlandırılır. Ad-Hoc Assocation normal Join gibi ikinci tablonun herhangi bir alanını kullanmak üzerine geliştirilen Assocation'lardır. Exposed Association ise ilgili View için bir alan olarak görünmez ancak başka bir View aracılığıyla erişim sağlandığı zaman direk olarak orada kullanılabilir.

![image](https://user-images.githubusercontent.com/26427511/146602969-521ef4f3-61c8-4ac6-8016-162dcc407636.png)

##### A-)Ad-Hoc Association;

![image](https://user-images.githubusercontent.com/26427511/146594446-d27df677-da07-46b2-b881-023c44b8cfb8.png)

![image](https://user-images.githubusercontent.com/26427511/146594494-9e98bc13-0bb6-4b45-8298-54f1e7a166e2.png)

![image](https://user-images.githubusercontent.com/26427511/146594539-6106940c-7276-4f2f-938b-2bb5d34826bd.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_6.abap)

##### B-)Exposed Association;

![image](https://user-images.githubusercontent.com/26427511/146595348-59b36649-0cf0-47b0-bbae-54f80335ccf2.png)

![image](https://user-images.githubusercontent.com/26427511/146595405-59a58d10-2106-4ef3-922a-58ddfc79b8ac.png)

![image](https://user-images.githubusercontent.com/26427511/146600287-b0937616-f974-40b2-a6ff-57e1afeeda8f.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_7.abap)

##### Note: 
Exposed Association'lar SQL Create Statement'da görüldüğü gibi Join oluşturulmaz, Join kurulan tablolara runtime zamanında erişim sağlanır.
 
![image](https://user-images.githubusercontent.com/26427511/146600558-0d7d5282-5d44-4dac-92a7-5b45621ab727.png)

![image](https://user-images.githubusercontent.com/26427511/146596446-399e7584-c0e0-4b53-aa89-478596a9d8b7.png)


#### Örnek: Exposed Association'ların Program İçinde Kullanılması;

![image](https://user-images.githubusercontent.com/26427511/146599812-0de9b99c-e0c6-4a90-bb00-44cc4c4be7f2.png)

![image](https://user-images.githubusercontent.com/26427511/146600137-d25b2230-6631-4176-88a1-6c98a1e08ff4.png)

[Go to code](sourceCode/ZAATAN_CDS_DEMO_8.abap)


#### Cardinality'lerin Select Sorgularındaki Davranışlarının İncelenmesi

Örneğimizde, SPFLI tablosunu kaynak tablo ve SFLIGHT'ı ilişkili tablo olarak değerlendirelim ve anlayabilmemiz için tablo verilerini CARRID = 'AA' ve CONNID = '17' olarak sınırlandıralım.

##### -SPFLI Tablosu 
![image](https://user-images.githubusercontent.com/26427511/146823984-6c34a884-6014-4037-a655-360cb915d43f.png)

##### -SFLIGHT Tablosu 
![image](https://user-images.githubusercontent.com/26427511/146818678-0563ff65-3dc7-43ee-83ac-5e8f63f37c31.png)


##### A-) İlişkili Tablo SFLIGHT'ta kardinalite [0..1] veya [1..1] olduğunda;

![image](https://user-images.githubusercontent.com/26427511/146824991-9606971d-9f46-42a5-826a-4f8591a94056.png)
 [Go to code](sourceCode/ZAATAN_CDS_DEMO_9.abap)

Yukarıdakş CDS View'de, ilişkilendirmede kardinalite [ 0..1 ](İlişkili tablo SFLIGHT, SPFLI kaynak tablosu için 0 veya 1 girişe sahip olabilir) kullandık. SPFLI ve SFLIGHT arasındaki ilişki 1'e çoktur. Fakat sorgularda SFLIGHT tablosuna ait hiçbir alan seçilmezse Join gerçekleşmez ve SPFLI tablosundaki kayıtlar çoğaltılmaz.
Bu durumdan yola çıkarsak Cardinality [0..1]'in dahili olarak LEFT OUTER TO ONE JOIN ile aynı şekilde çalıştığını söyleyebiliriz.

![image](https://user-images.githubusercontent.com/26427511/146822679-24254d4d-aa75-4c0b-a012-11c3ff03fd0f.png),
 [Go to code](sourceCode/ZAATAN_CDS_DEMO_10.abap)

Yukarıdaki programda SELECT sorgusunda, CDS'e ait yalnızca SPFLI tablosunun alanları olan CARRID, CONNID ve DISTANCE alanlarına eriştik. Önem derecesi [0..1]'dir, bu, CDS'nin programda nasıl kullanıldığına bağlı olarak ilişkili tablonun(SFLIGHT) 0 veya 1 girişe sahip olabileceği anlamına gelir.

Yukarıdaki örnek program için, SFLIGHT.FLDATE, CDS ZAATAN_CDS_08'den SELECT deyiminde seçilmediğinden, CDS View'de SPFLI ve SFLIGHT arasında JOIN gerçekleşmez ve dahili olarak yalnızca tablo SPFLI'ye erişilir. Böylece kayıtlar çoğaltılmaz.

##### -Çıktı;
![image](https://user-images.githubusercontent.com/26427511/146825503-70d43076-dbe9-4f40-9290-9ce769613d74.png)


##### B-) İlişkili Tablo SFLIGHT'ta kardinalite [0..* ] veya [1..* ] olduğunda;

![image](https://user-images.githubusercontent.com/26427511/146825757-6a2ee253-1851-4002-86d9-ebec89bf5fcc.png)
 [Go to code](sourceCode/ZAATAN_CDS_DEMO_11.abap)

Yukarıdaki CDS View'de, ilişkilendirmede kardinalite [ 0..*] (İlişkili tablo SFLIGHT, SPFLI kaynak tablosu için 0 veya * girişe sahip olabilir) kullandık. Bu nedenle, SELECT sorgularda ilişkili SFLIGHT tablosundan hiçbir öznitelik kullanılmadığında bile SFLIGHT tablosu ile JOIN gerçekleşir ve SFLIGHT tablosuna dahili olarak da erişilir.

Tablo SPFLI ve SFLIGHT arasındaki ilişki 1'den n kadardır ve ilişkili tablo SFLIGHT'ın kardinalitesi [0..*] veya [1..*] olarak ayarlandığında, SELECT sorgusunun sonucunda JOIN gerçekleşir. SFLIGHT alanları seçilmiyor olsa bile SPFLI'den gelen kayıtlar çoğaltılır.
Dolayısıyla, Cardinality [0..*] ve [1..*] dahili olarak LEFT OUTER JOIN ile aynı şekilde çalıştığını söyleyebiliriz.

![image](https://user-images.githubusercontent.com/26427511/146828239-52c27c8f-c4fb-41e7-ad00-12d63377dfbc.png)
 [Go to code](sourceCode/ZAATAN_CDS_DEMO_12.abap)

Aynı SELECT Sorgusu ile, kardinalite [0..*] olduğundan, JOIN gerçekleşir (SFLIGHT alanları SELECT sorgusunda kullanılmasa bile) ve hem SPFLI hem de SFLIGHT tablolarına dahili olarak erişilir. Böylece kayıtlar çoğaltılır.

##### -Çıktı;
![image](https://user-images.githubusercontent.com/26427511/146828164-bf087d39-a396-4e17-8c6b-f7ea0595988e.png)

##### Note:
 Kardinalite, SELECT ifadesi tamamen aynı olduğunda bile sorgunun davranışını değiştirebilir.


