use test;
db.reports.findAndModify({ query:{report:1}, update:{$set:{report:0}} });
