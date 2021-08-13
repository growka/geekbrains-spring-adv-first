create table products
(
    id         bigserial primary key,
    title      varchar(255),
    price      int,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

insert into products (title, price)
values ('Bread', 24),
       ('Milk', 65),
       ('Cheese', 320);

create table order_items
(
    id             bigserial primary key,
    title          varchar(255),
    quantity       int,
    price_per_item int,
    price          int
);

create table users 
(
	id 			bigserial primary key,
	username	varchar(30) not null unique,
	password	varchar(50) not null,
	email		varchar(50) unique,
	created_at	timestamp default current_timestamp,
    updated_at 	timestamp default current_timestamp
);

create table orders 
(
	id 			bigserial primary key,
	owner_id	bigserial references users (id),
	price		serial,
	address		varchar(255),
	created_at	timestamp default current_timestamp,
    updated_at 	timestamp default current_timestamp
);

create table roles
(
    id 		serial primary key,
    name 	varchar(30) not null unique,
    created_at	timestamp default current_timestamp,
    updated_at 	timestamp default current_timestamp
);

insert into roles(name) values ('ROLE_ADMIN');
insert into roles(name) values ('ROLE_USER');

create table users_roles
(
    user_id 	bigserial not null references users (id),
    role_id 	serial not null references roles (id),
    primary key(user_id, role_id)
);

create table carts
(
    id 			bigserial primary key,
    owner_id 	bigserial references users (id),
    price 		int
);

create table cart_items 
(
	id 				bigserial primary key,
	cart_id			bigserial references carts (id),
	product_id		bigserial references products (id),
	title			varchar(255),
	quantity		int,
	price_per_item	int,
	price 			int,
	created_at		timestamp default current_timestamp,
    updated_at 		timestamp default current_timestamp
);

create table order_items 
(
	id 				bigserial primary key,
	order_id		bigserial references orders (id),
	product_id		bigserial references products (id),
	title			varchar(255),
	quantity		int,
	price_per_item	int,
	price 			int,
	created_at		timestamp default current_timestamp,
    updated_at 		timestamp default current_timestamp
);

