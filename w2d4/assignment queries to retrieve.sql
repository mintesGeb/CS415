-- a
SELECT * FROM library_branch lb inner join book_copies bc
on lb.branch_id = bc.branch_id inner join book b
on bc.book_id=b.book_id
where b.title= "Knowing God" and lb.branch_name like "Mont%";
-- b
select * from library_branch lb inner join book_copies bc
on lb.branch_id=bc.branch_id inner join book b
on bc.book_id = b.book_id
where b.title = "Loving God";

-- c
select * from borrower where card_no not in (
select card_no from book_loans
);

-- d
select bl.book_id,b.title,bor.name from book_loans bl inner join book b
on bl.book_id=b.book_id inner join borrower bor
on bl.card_no=bor.card_no
where bl.due_date >= "2021-08-01";


select bl.book_id,b.title, bor.name, bor.address  from book_loans bl inner join library_branch lb
on bl.branch_id  = lb.branch_id inner join book b
on bl.book_id=b.book_id inner join borrower bor
on bl.card_no = bor.card_no
where lb.branch_name like "mont%" and bl.due_date>="2021-08-01";

-- e
select br.branch_name,count(br.branch_id) as books_checked_out from library_branch br inner join book_loans bl
on br.branch_id = bl.branch_id
group by br.branch_id;

-- f
select bor.name, bor.address, count(bor.card_no) from borrower bor inner join book_loans bl
on bor.card_no=bl.card_no
group by bor.card_no
having count(bor.card_no)>1;

-- g
select b.book_id, b.title, ba.author_name, bc.no_of_copies, lb.branch_name from book b inner join book_copies bc
on b.book_id = bc.book_id inner join book_authors ba
on b.book_id = ba.book_id inner join library_branch lb
on bc.branch_id=lb.branch_id
where ba.author_name like "%piper%" and lb.branch_name like "mont%"