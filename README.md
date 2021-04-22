# テーブル設計

## usersテーブル

| Column                 | Type    | Options                  |
| ---------------------- | ------  | ------------------------ |
| nickname               | string  | null: false              |
| email                  | string  | null: false,unique: true |
| encrypted_password     | string  | null: false              |
| last_name              | string  | null: false              |
| first_name             | string  | null: false              |
| last_name_kana         | string  | null: false              |
| first_name_kana        | string  | null: false              |
| birthday               | date    | null: false              |  

### Association
- has_many :items
- has_many :orders
- has_many   :comments

## itemsテーブル

| Column                     | Type       | Options                       |
| -------------------------- | ---------- | ----------------------------- |
| name                       | string     | null: false                   |
| description                | text       | null: false                   |
| details_status_id          | integer    | null: false                   |  ##ActiveHash使う
| details_category_id        | integer    | null: false                   |  ##ActiveHash使う
| shopping_charge_id         | integer    | null: false                   |  ##ActiveHash使う
| shipping_area_id           | integer    | null: false                   |  ##ActiveHash使う
| delivery_time_id           | integer    | null: false                   |  ##ActiveHash使う
| price                      | integer    | null: false                   |
| user                       |references  | null: false,foreign_key: true |
### Association
- belongs_to :user
- has_one    :order
- has_many   :comments



## shippingsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postcode          | string     | null: false                    |  
| shipping_area_id  | integer    | null: false                    |　##ActiveHash使う
| city              | string     | null: false                    |
| bloc              | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |   
| order             | references | null: false,foreign_key: true  |              

### Association
- belongs_to  :order



## ordersテーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null: false,foreign_key: true |
| item                   | references | null: false,foreign_key: true |

### Association
- belongs_to  :user
- belongs_to  :item
- has_one     :shipping


## commentsテーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null: false,foreign_key: true |
| item                   | references | null: false,foreign_key: true |
| comment                | text       | null: false                   |

### Association
- belongs_to  :user
- belongs_to  :item
