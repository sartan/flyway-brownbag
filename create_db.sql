drop database if exists flyway_demo;
drop role if exists flyway_demo;

create database flyway_demo;
create role flyway_demo login password 'flyway_demo';

grant all privileges on database flyway_demo to flyway_demo;