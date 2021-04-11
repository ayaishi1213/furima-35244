# テーブル設計

## usersテーブル

| Column                 | Type    | Options                  |
| ---------------------- | ------  | ------------------------ |
| nickname               | string  | null: false              |
| email                  | string  | null: false,unique: true |
| password               | string  | null: false              |
| password_confirmation  | string  | null: false              |
| last_name              | string  | null: false              |
| first_name             | string  | null: false              |
| last_name_kana         | string  | null: false              |
| first_name_kana        | string  | null: false              |
| birthday_id            | integer | null: false              |  ##ActiveHash使う

### Association
- has_many :products
- has_one  :shipping
- has_one  :purchase


## productsテーブル

| Column                     | Type       | Options       |
| -------------------------- | ---------- | ------------- |
| image                      | text       | null: false   |
| item_name                  | string     | null: false   |
| item_description           | text       | null: false   |
| item_details_id            | integer    | null: false   |  ##ActiveHash使う
| item_details_status_id     | integer    | null: false   |  ##ActiveHash使う
| item_details_category_id   | integer    | null: false   |  ##ActiveHash使う
| shopping_charge_id         | integer    | null: false   |  ##ActiveHash使う
| shipping_area_id           | integer    | null: false   |  ##ActiveHash使う
| delivery_time_id           | integer    | null: false   |  ##ActiveHash使う
| price                      | sting      | null: false   |

### Association
- belongs_to :user
- has_one    :shipping
- has_one    :purchase



## shippingsテーブル

| Column        | Type       | Options                        |
| ---------     | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |  
| prefecture_id | integer    | null: false                    |　##ActiveHash使う
| city          | string     | null: false                    |
| bloc          | string     | null: false                    |
| building      | string     | null: false                    |
| phone_number  | string     | null: false, unique: true      |                 

### Association
- belongs_to :user
- has_many   :products
- belongs_to :purchase



## purchasesテーブル
| Column                 | Type     | Options                       |
| ---------------------- | ------   | ----------------------------- |
| user_id                | integer  | null: false,foreign_key: true |
| product_id             | integer  | null: false,foreign_key: true |

### Association
- has_one  :user
- has_one  :product
- has_one  :shipping