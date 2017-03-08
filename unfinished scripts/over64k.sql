Use AdventureWorks2008;
select top 120 * from Person.Person;
--this query is slightly above the 64k threshold so it should not be cached