SELECT rp.name AS Customer, so.create_date AS billedDate, pp.name_template as product, sol.comments as comment,
sol.product_uos_qty as quantity,
uom.name as unit, 
sol.price_unit as unitPrice,
(sol.price_unit * sol.product_uos_qty) as total

 FROM res_partner rp 
LEFT JOIN sale_order so ON so.partner_id = rp.id
INNER JOIN sale_order_line sol ON sol.order_id = so.id AND 
-- so.create_date between '#startDate#' and '#endDateTime#' AND
so.create_date BETWEEN '2016-04-24' AND '2016-04-24 23:59:59' 
-- AND so.x_payment_type ='INSURANCE'
LEFT JOIN product_product pp ON pp.id = sol.product_id
LEFT JOIN product_uom uom ON uom.id = sol.product_uom
WHERE rp.customer = true AND 
-- rp.ref='#patientIdentifier#'
rp.ref='BAH165614';