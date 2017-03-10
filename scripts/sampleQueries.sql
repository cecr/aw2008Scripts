--cacheable queries
select top 10 * from Person.RandomData;
select top 10 * from Person.RandomDato;
select top 100 * from Person.RandomData;
select top 100 * from Person.RandomDato;
select top 2 * from Person.RandomData;
select top 2 * from Person.RandomDato;
select top 20 * from Person.RandomData;
select top 20 * from Person.RandomDato;
select top 200 * from Person.RandomData;
select top 200 * from Person.RandomDato;
select top 5 * from Person.RandomData;
select top 5 * from Person.RandomDato;
select top 50 * from Person.RandomData;
select top 50 * from Person.RandomDato;
select top 100 * Person.Address;
select top 100 * from Person.ContactType;
select top 100 * from Product.BillOfMaterials;
select * from Production.Culture;

--above 64k aka uncacheable queries
select top 1000 from Person.Address;
select top 1000 from Person.Person;
select top 1001 from Person.Person;
select top 1010 from Person.Person;
select top 1000 from Person.EmailAddress
select top 1000 from Person.Password;