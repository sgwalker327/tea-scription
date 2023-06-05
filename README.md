# Tea-scription
An API to manage customer subscriptions for a subscription tea service.

## To use
1. Clone repository to local machine
2. Run bundle
3. Create,migrate and seed database
3. Run local server using rails s
4. Use postman/browser to reach endpoints described below

## Testing
1. After bundeling, run bundle exec rspec to run test suite

## Endpoints
Create a user subscription:
POST /api/v1/customers/:id/subscriptions
request: POST /api/v1/customers/1/subscriptions with subscription params
response:{
    "data": {
        "id": "10",
        "type": "subscription",
        "attributes": {
            "title": "Green Tea Everyday",
            "price": 14.5,
            "frequency": "monthly",
            "status": "active",
            "tea_id": 1,
            "customer_id": 1
        }
    }
}

Update status of subscription:
PUT /api/v1/customers/1/subscriptions/1
request: 
response:{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Green Tea Everyday",
            "price": 14.5,
            "frequency": "weekly",
            "status": "active",
            "tea_id": 1,
            "customer_id": 1
        }
    }
}

Get all customer subecriptions (active & canceled):
GET /api/v1/customers/:id/subscriptions
request: GET /api/v1/customers/1/subscriptions
response:{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Green Tea Everyday",
                "price": 14.5,
                "frequency": "weekly",
                "status": "cancelled",
                "tea_id": 1,
                "customer_id": 1
            }
        },
        {
            "id": "4",
            "type": "subscription",
            "attributes": {
                "title": "Everyday Earl",
                "price": 15.0,
                "frequency": "weekly",
                "status": "active",
                "tea_id": 2,
                "customer_id": 1
            }
        },
        {
            "id": "7",
            "type": "subscription",
            "attributes": {
                "title": "Black Tea Pretty Frequently",
                "price": 11.5,
                "frequency": "biweekly",
                "status": "active",
                "tea_id": 3,
                "customer_id": 1
            }
        }
    ]
}