-- a
select b.title, lb.branch_name, count(*) as copies  from library_branch lb inner join book_copies bc
on lb.branch_id=bc.branch_id inner join book b
on bc.book_id=b.book_id
where lb.branch_name like "Mont%" and b.title="loving God";

-- b
select bc.branch_id, lb.branch_name, bc.no_of_copies, b.title from book_copies bc inner join book b
on bc.book_id=b.book_id inner join library_branch lb
on bc.branch_id=lb.branch_id
where b.title ="loving God";

-- c opt1
select * from borrower where card_no not in(
select card_no from book_loans
);

-- d 
select b.title, bor.name, bor.address from book_loans bl inner join library_branch lb
on bl.branch_id = lb.branch_id inner join book b
on bl.book_id=b.book_id inner join borrower bor
on bl.card_no=bor.card_no
where lb.branch_name like "Mont%" and bl.due_date >="2021-08-01";

-- e
-- select * from book_loans;
select lb.branch_name, count(bl.book_id) from book_loans bl inner join library_branch lb
on bl.branch_id=lb.branch_id
group by bl.branch_id;

-- f

select bor.name, bor.address, count(bl.book_id) as no_of_books from book_loans bl inner join borrower bor
on bl.card_no=bor.card_no
group by bl.card_no
having no_of_books >1;

-- g
select b.title, ba.author_name, lb.branch_name,bc.no_of_copies from book_copies bc inner join book_authors ba
on bc.book_id=ba.book_id inner join book b
on bc.book_id=b.book_id inner join library_branch lb
on lb.branch_id=bc.branch_id
where ba.author_name like "%Pip%" and lb.branch_name like "Mont%"