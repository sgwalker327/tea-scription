# Tea-scription
This is an API to help you manage subscriptions, customers, and teas for your subscription tea service.

## Built With
It was built using Ruby, Rails, and PostgreSQL.

![Ruby](https://img.shields.io/badge/Ruby-CC342D.svg?style=for-the-badge&logo=Ruby&logoColor=white)
![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-CC0000.svg?style=for-the-badge&logo=Ruby-on-Rails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1.svg?style=for-the-badge&logo=PostgreSQL&logoColor=white)

## To use/install
1. Clone repository to local machine
2. Install gems. Run ` bundle  install ` in you console.
4. Create, migrate, and seed database by running ` rails db:{create,migrate,seed} ` in your console.
5. Run local server using ` rails s `
6. Use postman/browser to reach endpoints described below

## Testing
1. After bundling, run  ` bundle exec rspec ` to run test suite

## Endpoints
1. Create a user subscription:
POST /api/v1/customers/:id/subscriptions
request: POST `/api/v1/customers/1/subscriptions w/ subscription params`
response:
``` 
{
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
```

2. Update status of subscription:
PUT /api/v1/customers/:id/subscriptions/:id
request: PUT `/api/v1/customers/1/subscriptions/1`
response:
 ```
 {
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
```
3. Get all customer subecriptions (active & canceled):
GET /api/v1/customers/:id/subscriptions
request: GET `/api/v1/customers/1/subscriptions`
response:
```
 {
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
```
## Schema
![schema](schema_screenshot.png)

