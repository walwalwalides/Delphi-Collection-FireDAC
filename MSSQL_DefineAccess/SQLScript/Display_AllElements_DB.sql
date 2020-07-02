SELECT ProductID ,Typs.TypDescription,Marks.MarkDescription,Model,SerialNumber,Price
FROM Products, Typs, Marks
WHERE (Products.TypID=Typs.TypID) and (Products.MarkID=Marks.MarkID)
