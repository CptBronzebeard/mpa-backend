start transaction;

INSERT INTO disease (id, name) VALUES (2, 'Желудочковая аритмия');

insert into attributes(id, name, type) values (16, 'VA registered', 'bool');
insert into attributes(id, name, type) values (17, 'Main disease registered', 'bool');
insert into attributes(id, name, type) values (18, 'Exercise stress test', 'enum');
insert into attributes(id, name, type) values (19, 'EchoCG stress-testing, exercise test with Ng', 'enum');
insert into attributes(id, name, type) values (20, 'AD', 'enum');
insert into attributes(id, name, type) values (21, 'AAE', 'enum');

insert into attribute_values(id, attribute_id, value) values (20, 18, 'negative: VA is not present during exercise. VA caused by parasympathetic system activation');
insert into attribute_values(id, attribute_id, value) values (21, 18, 'uncertain: VA is present and/or progressing');
insert into attribute_values(id, attribute_id, value) values (22, 18, 'positive: Ischemic VA');
insert into attribute_values(id, attribute_id, value) values (23, 19, 'negative: VA is present and/or progressing. VA caused by sympathetic system activation');
insert into attribute_values(id, attribute_id, value) values (24, 19, 'positive: Ischemic VA');
insert into attribute_values(id, attribute_id, value) values (25, 20, 'positive');
insert into attribute_values(id, attribute_id, value) values (26, 20, 'negative');
insert into attribute_values(id, attribute_id, value) values (27, 21, 'positive');
insert into attribute_values(id, attribute_id, value) values (28, 21, 'negative');

insert into disease_attributes(id, requirement_id, requirement_type_id, is_required, attribute_id) values (16, 2, 1, false, 16);
insert into disease_attributes(id, requirement_id, requirement_type_id, is_required, attribute_id) values (17, 2, 1, false, 17);
insert into disease_attributes(id, requirement_id, requirement_type_id, is_required, attribute_id) values (18, 2, 1, false, 18);
insert into disease_attributes(id, requirement_id, requirement_type_id, is_required, attribute_id) values (19, 2, 1, false, 19);
insert into disease_attributes(id, requirement_id, requirement_type_id, is_required, attribute_id) values (20, 2, 1, false, 20);
insert into disease_attributes(id, requirement_id, requirement_type_id, is_required, attribute_id) values (21, 2, 1, false, 21);

insert into state(id, name, description, disease_id) values (20, 'HSt 1', 'VA Not registered', 2);
insert into state(id, name, description, disease_id) values (21, 'HSt 2', 'CAD; MR; CAD comprehensive treatment', 2);
insert into state(id, name, description, disease_id) values (22, 'HSt 3', 'Cured patient', 2);
insert into state(id, name, description, disease_id) values (23, 'HSt 4', 'CA is discussed with patient', 2);

insert into state(id, name, description, disease_id) values (24, 'HS1', 'ECG, ECG Monitoring', 2);
insert into state(id, name, description, disease_id) values (25, 'HS2', 'Specialized protocol ECG; EchoCG; laboratory tests, consultations of doctors of other specialization, КТ, CMR, medical genetical consultation', 2);
insert into state(id, name, description, disease_id) values (26, 'HS3', 'Main disease curing / eliminating reversible consequences', 2);
insert into state(id, name, description, disease_id) values (27, 'HS4', 'Exercise stress test', 2);
insert into state(id, name, description, disease_id) values (28, 'HS5', 'EchoCG stress-testing, exercise test with Ng', 2);
insert into state(id, name, description, disease_id) values (29, 'HS6', 'Psychodiagnostics', 2);
insert into state(id, name, description, disease_id) values (30, 'HS7', 'Psychodiagnostics', 2);
insert into state(id, name, description, disease_id) values (31, 'HS8', 'Psychotropic drugs (adaptol); psychotherapy. Might be combined with class Ic antiarrhythmic agent with anticholinergic effect (ethacyzin).', 2);
insert into state(id, name, description, disease_id) values (32, 'HS9', 'Class Ic antiarrhythmic agent with anticholinergic effect (ethacyzin).', 2);
insert into state(id, name, description, disease_id) values (33, 'HS10', 'Psychotropic drugs (adaptol); psychotherapy. Might be combined with beta-blockers', 2);
insert into state(id, name, description, disease_id) values (34, 'HS11', 'Beta-blockers', 2);

insert into transition(id, state_from_id, state_to_id, predicate) values (31, 24, 25, 'eq ({status.16}, true)');
insert into transition(id, state_from_id, state_to_id, predicate) values (32, 25, 27, 'eq ({status.17}, false)');
insert into transition(id, state_from_id, state_to_id, predicate) values (33, 25, 26, 'eq ({status.17}, true)');
insert into transition(id, state_from_id, state_to_id, predicate) values (34, 26, 27, 'eq (1, 1)');
insert into transition(id, state_from_id, state_to_id, predicate) values (35, 27, 28, 'eq ({status.18}, 21)');
insert into transition(id, state_from_id, state_to_id, predicate) values (36, 27, 29, 'eq ({status.18}, 20)');
insert into transition(id, state_from_id, state_to_id, predicate) values (37, 28, 30, 'eq ({status.19}, 23)');
insert into transition(id, state_from_id, state_to_id, predicate) values (38, 29, 31, 'eq ({status.20}, 25)');
insert into transition(id, state_from_id, state_to_id, predicate) values (40, 29, 32, 'eq ({status.20}, 26)');
insert into transition(id, state_from_id, state_to_id, predicate) values (41, 30, 33, 'eq ({status.20}, 25)');
insert into transition(id, state_from_id, state_to_id, predicate) values (42, 30, 34, 'eq ({status.20}, 26)');

insert into transition(id, state_from_id, state_to_id, predicate) values (43, 24, 20, 'eq ({status.16}, false)');
insert into transition(id, state_from_id, state_to_id, predicate) values (44, 27, 21, 'eq ({status.18}, 22)');
insert into transition(id, state_from_id, state_to_id, predicate) values (45, 28, 21, 'eq ({status.19}, 24)');
insert into transition(id, state_from_id, state_to_id, predicate) values (46, 31, 22, 'eq ({status.21}, 28)');
insert into transition(id, state_from_id, state_to_id, predicate) values (47, 31, 23, 'eq ({status.21}, 27)');
insert into transition(id, state_from_id, state_to_id, predicate) values (48, 32, 22, 'eq ({status.21}, 28)');
insert into transition(id, state_from_id, state_to_id, predicate) values (49, 32, 23, 'eq ({status.21}, 27)');
insert into transition(id, state_from_id, state_to_id, predicate) values (50, 33, 22, 'eq ({status.21}, 28)');
insert into transition(id, state_from_id, state_to_id, predicate) values (51, 33, 23, 'eq ({status.21}, 27)');
insert into transition(id, state_from_id, state_to_id, predicate) values (52, 34, 22, 'eq ({status.21}, 28)');
insert into transition(id, state_from_id, state_to_id, predicate) values (53, 34, 23, 'eq ({status.21}, 27)');

commit;
