# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

## Association
- has_many :items
- has_many :buyers

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false,                   |
| description        | text       | null: false                    |
| category           | text       | null: false                    |
| condition          | text       | null: false                    |
| shipping_cost      | string     | null: false,                   |
| shipping_from      | string     | null: false,                   |
| shipping_time      | string     | null: false,                   |
| price              | string     | null: false,                   |
| user               | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :buyers

## buyersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_cord          | string     | null: false,                   |
| prefectures        | text       | null: false                    |
| city               | text       | null: false                    |
| address            | text       | null: false                    |
| building_name      | string     | null: false,                   |
| phone_number       | string     | null: false,                   |
| items              | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## Association
- has_many :items
- belongs_to :user