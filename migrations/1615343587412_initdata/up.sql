insert into  public.candidates (id, university, study_completion_timeframe, status) values
(2, 'Sydney University', '2022/6/30', 'graduating'),
(3, 'Sydney University', '2020/7/5', 'graduated'),
(4, 'Sydney University', '2024/7/5', 'studying'),
(5, 'Melbourne University', '2023/7/5', 'studying'),
(6, 'Melbourne University', '2022/7/5', 'graduating'),
(8, 'Melbourne University', '2019/7/5', 'graduated'),
(9, 'Canberra University', '2022/7/5', 'graduating'),
(10, 'Canberra University', '2025/7/5', 'studying'),
(11, 'Canberra University', '2010/7/5', 'graduated');
insert into public.clients (id, created_at, updated_at, business_name, year_founded, employee_count, services_provided, terms_signed, user_id, sf_account) values
(1,'2021-03-05 03:05:48.630058+00', '2021-03-05 03:05:48.630058+00', 'Microsoft Corporation',  '1980', '10000', null, null,null, null),
(2,'2021-03-05 03:06:38.809575+00', '2021-03-05 03:06:38.809575+00', 'Oracle database company',  '1985', '8000', null, null,null, null),
(4,'2021-03-05 03:07:25.111533+00', '2021-03-05 03:07:25.111533+00', 'Google Co. Ltd',    '2002', '12000', null, null,null, null),
(6,'2021-03-05 04:23:46.478132+00', '2021-03-05 04:23:46.478132+00', 'Car company1',            '1920','50000', null, null,null, null),
(7,'2021-03-05 04:23:55.800091+00', '2021-03-05 04:23:55.800091+00', 'Car company2',    '1950' ,'10000', null, null,null, null);
insert into public.tenants (id, name, created_at, updated_at, enabled, uid, owner_id, domain) values
(1, 'dragon company', '2021-03-05 04:17:00.665641+00', '2021-03-05 04:17:00.665641+00', 't', '3dce19d4-69d9-4df4-8783-0c10aaf40977', null,null),
(2, 'hawk company', '2021-03-05 04:17:45.317582+00', '2021-03-05 04:17:45.317582+00', 't', '6a922021-7cba-45db-b45b-926490ed0e69', null,null),
(3, 'rabbit', '2021-03-05 04:18:13.991102+00', '2021-03-05 04:18:13.991102+00', 't', 'e8e9e588-3dcd-4e92-9b85-6a67aca8a3af', null,null);
insert into public.teams (id, tenant_id, name, created_at, updated_at) values
(1,1, 'software', '2021-03-05 04:20:19.857843+00', '2021-03-05 04:20:19.857843+00'),
(2,2, 'Merchant', '2021-03-05 04:20:52.413864+00', '2021-03-05 04:20:52.413864+00');
insert into  public.jobs (id, created_at, updated_at, title, contract_type, team_id) values
(1, '2021-03-05 04:27:48.456394+00', '2021-03-05 04:27:48.456394+00', 'Software Engineer', 'full time', '1'),
(2, '2021-03-05 04:27:58.264541+00', '2021-03-05 04:27:58.264541+00', 'Senior Software Engineer', 'full time', '1'),
(3, '2021-03-05 04:28:21.760536+00', '2021-03-05 04:28:21.760536+00', 'Junior Software Engineer', 'part-time', '1'),
(4, '2021-03-05 04:28:39.037652+00', '2021-03-05 04:28:39.037652+00', 'saler ', 'full-time', '2'),
(5, '2021-03-05 04:29:30.838086+00', '2021-03-05 04:29:30.838086+00', 'HR ', 'full-time', '2'),
(6, '2021-03-05 04:29:45.24756+00', '2021-03-05 04:29:45.24756+00', 'department manager', 'full-time', '2');
insert into public.users (id, created_at, updated_at, email, auth0_uid, first_name, last_name, mobile, client_id, candidate_id, tenant_id) values
(1, '2021-03-05 04:33:50.912558+00', '2021-03-05 04:33:50.912558+00', 'aaa@gmail.com', 'f10c6b79-99ea-4ce3-ab3c-a7a871b810b3', 'John', 'Liu', '0426998755', null,'3', '1'),
(4, '2021-03-05 04:37:16.934189+00', '2021-03-05 04:37:16.934189+00', 'samuelliu98@gmail.com', '76726396-fe7c-492a-868c-e138704cd61b', 'Samuel', 'Liu', '0426998563', null,'3', '3'),
(5, '2021-03-05 04:38:51.899293+00', '2021-03-05 04:38:51.899293+00', 'jameslee@yahoo.com', '56c1043a-a0df-4699-b7a9-f0f9c5b2a350', 'James', 'Lee', '0487963567', null,'2', '1'),
(7, '2021-03-05 04:41:37.529403+00', '2021-03-05 04:41:37.529403+00', 'admin@microsoft.com', 'ca4bdf34-7217-44be-95b3-c3c80154b186', 'Microsoft', 'Windows', '0478888666', '1',null,null),
(8, '2021-03-05 04:53:08.947127+00', '2021-03-05 04:53:08.947127+00', 'admin@oracle.com', 'eb59bdb1-9008-465a-af12-d9548e01d535', 'Oracle', 'Company', '0487777888', '2', null,null),
(9, '2021-03-05 04:54:45.62162+00', '2021-03-05 04:54:45.62162+00', 'googleadmin@gmail.com', '0b285096-42e4-425f-8e8b-02c936c20120', 'Google', 'Company', '0412999777', '4', null,null),
(10, '2021-03-05 05:03:23.419816+00', '2021-03-05 05:03:23.419816+00', 'carcompany1@toyota.com', '3ed9b4aa-92d3-488d-8497-e9fae521199e3ed9b4aa-92d3-488d-8497-e9fae521199e','TOYOTO', 'JAPAN', '0208777888', '6', null,null),
(11, '2021-03-05 05:04:33.107977+00', '2021-03-05 05:04:33.107977+00', 'carcompany2@toyota.com', '62863e56-650f-4981-8060-c7e2a66458bb', 'BMB', 'Deutsch', '0208999666', '7', null,null),
(12, '2021-03-05 05:06:00.802636+00', '2021-03-05 05:06:00.802636+00', 'dragonadmin@dragon.com', '84d37eb4-fd0c-4d50-8237-131021d49af0', 'Dragon', 'Company', '0208999825', null,null, '1'),
(13, '2021-03-05 05:06:47.402267+00', '2021-03-05 05:06:47.402267+00', 'hawkadmin@hawk.com', '0a01bdcd-5f22-41b6-b9ed-d390c7a6fd9d', 'Hawk', 'Company', '0208777825', null,null, '2'),
(14, '2021-03-05 05:07:28.739311+00', '2021-03-05 05:07:28.739311+00', 'rabbitadmin@hawk.com', '92ad7391-8ef7-4f62-859e-f1247c8e9378', 'rabbit', 'Company', '0208777638', null, null, '3');
insert into public.users_teams (id, created_at, updated_at, team_id, user_id, deleted_at) values
(1, '2021-03-05 05:09:05.836141+00', '2021-03-05 05:09:05.836141+00', '1', '1', null),
(2, '2021-03-05 05:09:51.632396+00', '2021-03-05 05:09:51.632396+00', '1', '4', null),
(3, '2021-03-05 05:10:11.33548+00', '2021-03-05 05:10:11.33548+00', '2', '4', null);
