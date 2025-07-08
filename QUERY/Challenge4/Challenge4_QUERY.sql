--. Challenge 4: User Churn Analysis

--Scenario: Marketing needs to save at-risk customers.
--Task: Find users who:

    --Made 1 purchase 6+ months ago

    --Haven’t logged in for 3+ months

    --Never received a re-engagement email

select
 u.username
  ,u.last_login,
 max(p.purchase_date) as Last_Purchase_date
 from user_activity as u
 left join purchases as p
 on u.user_id=p.user_id
 where
  u.received_reengagement_email='No'
 and ( u.last_login is null or u.last_login < date('now','-3 months'))
 and ( p.purchase_Date is null or p.purchase_Date < date('now','-6 months'))
 group by 
 u.username,u.user_id,u.last_login,p.purchase_Date;
