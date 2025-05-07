with sub_purchase_cost AS (
    select 
     date_date
    ,products_id
    ,orders_id
    ,revenue
    ,quantity
    ,purchase_price
    ,ROUND((purchase_price*quantity),2) AS purchase_cost
    from {{ ref('stg_raw__sales') }}
    join {{ ref('stg_raw__product') }}
    using(products_id)
)

select *    
    ,ROUND((revenue-purchase_cost),2) AS margin
from sub_purchase_cost


/*  

OU deuxième query possible 

SELECT
      products_id,
      date_date,
      orders_id,
      revenue,
      quantity,
      purchase_price,
      ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
      ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin
  FROM {{ref("stg_raw__sales")}} s
  LEFT JOIN {{ref("stg_raw__product")}} p
      USING (products_id)

*/ 

