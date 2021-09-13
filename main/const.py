PROCESSING_ORDER = 1
ORDER_SENT_TO_WAREHOUSE = 2
SHIPPED = 3
DELIVERED = 4
STATUS_CHOICES = (
    (PROCESSING_ORDER, ('We got your order!')),
    (ORDER_SENT_TO_WAREHOUSE, ('Order is sent to werahouse')),
    (SHIPPED, ('We have packaged your items and have handed your package to our trusted carriers. ')),
    (DELIVERED, ('Delivered')),
)