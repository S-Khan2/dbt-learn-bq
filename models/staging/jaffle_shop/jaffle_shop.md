{% docs order_status %}
	
One of the following values: 

| status         | definition                                        |
|----------------|---------------------------------------------------|
| placed         | Order placed, but not shipped                     |
| shipped        | Order has been shipped, but hasn't been delivered |
| completed      | Order has been received by customer               |
| return_pending | Customer indicated they want to return this item  |
| returned       | Item has been returned                            |

{% enddocs %}