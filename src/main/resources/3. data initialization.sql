USE ssi
GO
BEGIN TRANSACTION;
  BEGIN TRY

    -- security
    SET IDENTITY_INSERT [dbo].[role] ON
    INSERT INTO role (id, role_name, description) VALUES (1, 'STANDARD_USER', 'Standard User - Has no admin rights');
    INSERT INTO role (id, role_name, description) VALUES (2, 'ADMIN_USER', 'Admin User - Has permission to perform admin tasks');
    INSERT INTO role (id,role_name,description) VALUES(3,'STANDARD_USER' ,'Jefe de Operaciones');
    INSERT INTO role (id,role_name,description) VALUES(4,'STANDARD_USER' ,'Jefe de Operciones electricista');
    INSERT INTO role (id,role_name,description) VALUES(5,'STANDARD_USER','Jefe de Operciones Plomero')
    SET IDENTITY_INSERT [dbo].[role] OFF

    SET IDENTITY_INSERT [dbo].[person] ON
    insert into person (id, first_name, last_name, birth_date, gender, ci) values (1, 'admin', 'admin', '2000-05-26', 'MALE','1111111');
    insert into person (id, first_name, last_name, birth_date, gender, ci) values (2, 'john', 'doe', '2000-05-26', 'MALE', '2222222');
    insert into person (id, first_name, last_name, birth_date, gender, ci) values (3, 'nicol', 'admin', '2015-05-26', 'MALE', '333333');
    SET IDENTITY_INSERT [dbo].[person] OFF

    -- USER
    -- non-encrypted password: jwtpass
    SET IDENTITY_INSERT [dbo].[user_login] ON
    INSERT INTO user_login (id, password, username, person_id) VALUES (1, '821f498d827d4edad2ed0960408a98edceb661d9f34287ceda2962417881231a', 'john.doe', 2);
    INSERT INTO user_login (id, password, username, person_id) VALUES (2, '821f498d827d4edad2ed0960408a98edceb661d9f34287ceda2962417881231a', 'admin.admin', 1);
    SET IDENTITY_INSERT [dbo].[user_login] OFF


    INSERT INTO user_role(user_id, role_id) VALUES(1,1);
    INSERT INTO user_role(user_id, role_id) VALUES(2,1);
    INSERT INTO user_role(user_id, role_id) VALUES(2,2);


    --- AREA
    -- insert values Area

    SET IDENTITY_INSERT [dbo].[area] ON
    INSERT INTO area(id,name,description,codigo,is_deleted) VALUES(1,'Area A','Planta Baja' ,'001',0);
    INSERT INTO area(id,name,description,codigo,is_deleted) VALUES(2,'Area B','Planta Baja' ,'002',0);
    INSERT INTO area(id,name,description,codigo,is_deleted) VALUES(3,'Area C','Planta Alta' ,'003',0);
    SET IDENTITY_INSERT [dbo].[area] OFF

    -- Type Employee
    SET IDENTITY_INSERT [dbo].[employee_type] ON
    insert into employee_type (id, name, description) values (1, 'Obrero', 'pesronal de man de obra');
    insert into employee_type (id, name, description) values (2, 'Maestro Constructor', 'pesronal de man de obra');
    insert into employee_type (id, name, description) values (3, 'Contratista', 'pesronal de man de obra');
    insert into employee_type (id, name, description) values (4, 'Administrativo', 'pesronal de man de obra');
    insert into employee_type (id, name, description) values (5, 'Ejecutivo', 'pesronal de man de obra');
    insert into employee_type (id, name, description) values (6, 'Capataz', 'Encargado del Area A')
    insert into employee_type (id, name, description) values (7, 'Obrero', 'Trabajador del Area B')
    insert into employee_type (id, name, description) values (8, 'Electricista', 'Consultor del Area S')
    SET IDENTITY_INSERT [dbo].[employee_type] OFF

    -- Employee
    SET IDENTITY_INSERT [dbo].[employee] ON
    insert into employee (id, ci, first_name, last_name, birth_date, gender, email, phone, address, salary, is_deleted, employee_type_id) values (1, '7676764', 'carmen', 'guzman', '1990-05-26', 'FEMALE', 'carmen@guzman.com', 70304856, 'sacaba', 4000.00, 0, 1);
    insert into employee (id, ci, first_name, last_name, birth_date, gender, email, phone, address, salary, is_deleted, employee_type_id) values (2, '5454345', 'Carlos', 'Cori', '1980-05-26', 'MALE', 'carlos@cori.com', 70304800, 'tiquepaya', 4000.00, 0, 1);
    insert into employee (id, ci, first_name, last_name, birth_date, gender, email, phone, address, salary, is_deleted, employee_type_id) values (3, '1234567', 'Maximilian', 'Toro', '1985-05-26', 'MALE', 'maxi@toro.com', 60574635, 'quillacollo', 5000.00, 0, 2);
    insert into employee (id, ci, first_name, last_name, birth_date, gender, email, phone, address, salary, is_deleted, employee_type_id) values (4, '1234567', 'Marco', 'Herrera', '1986-05-26', 'MALE', 'marco@herrera.com', 67453634, 'sebastian pagador', 5000.00, 0, 3);
    insert into employee (id, ci, first_name, last_name, birth_date, gender, email, phone, address, salary, is_deleted, employee_type_id) values (5, '5666778', 'Guido', 'Llanos', '1986-05-26', 'MALE', 'guido@llanos.com', 60584736, 'zona norte', 4000.00, 0, 6);
    insert into employee (id, ci, first_name, last_name, birth_date, gender, email, phone, address, salary, is_deleted, employee_type_id) values (6, '7876534', 'Lidia', 'Cussi', '1986-05-26', 'FEMALE', 'lidia@cussi.com', 77234567, 'quillacollo', 5000.00, 0, 5);
    SET IDENTITY_INSERT [dbo].[employee] OFF

    --MaterialType
    --ALTER TABLE material_type CHANGE name name_type VARCHAR (255)
    SET IDENTITY_INSERT [dbo].[material_type] ON
    insert into material_type (id, name_type) values (1, 'proteccion personal')
    insert into material_type (id, name_type) values (2, 'seguridad')
    insert into material_type (id, name_type) values (3, 'proteccion para alto voltage')
    insert into material_type (id, name_type) values (4, 'Adicional')
    SET IDENTITY_INSERT [dbo].[material_type] OFF

    --Material
    SET IDENTITY_INSERT [dbo].[material] ON
    insert into material (id, name, material_description, material_type_id,vida_util) values (1, 'casco', 'description01', 1,12)
    insert into material (id, name, material_description, material_type_id,vida_util) values (2, 'arnez', 'description02', 2,13)
    insert into material (id, name, material_description, material_type_id,vida_util) values (3, 'botas', 'description03', 1,5)
    SET IDENTITY_INSERT [dbo].[material] OFF

    --Assignment
    SET IDENTITY_INSERT [dbo].[assignment] ON
    insert into assignment(id,assignment_date,quantity,employee_id,material_id) values (1,'2018-06-05',1,2,1)
    SET IDENTITY_INSERT [dbo].[assignment] OFF

    -- capacity
    SET IDENTITY_INSERT [dbo].[capacity] ON
    insert into capacity(id,name,description,is_deleted) values (1, 'Pintor', 'descripcion Capacidad A', 0)
    insert into capacity(id,name,description,is_deleted) values (2, 'Encofrador', 'descripcion Capacidad B', 0)
    insert into capacity(id,name,description,is_deleted) values (3, 'Maquinista', 'descripcion Capacidad C', 0)
    SET IDENTITY_INSERT [dbo].[capacity] OFF

    --Employee_capacities
    insert into employee_capacities (employee_id, capacities_id) values (2, 1);
    insert into employee_capacities (employee_id, capacities_id) values (2, 2);
    insert into employee_capacities (employee_id, capacities_id) values (1, 3);

    -- Personal Information
    -- insert PersonalInformation
    INSERT INTO personal_information(legal_name,employee_id,area_id,registration_date,is_deleted) VALUES('legalName',4,1,'1990-05-26',0);
    INSERT INTO personal_information(legal_name,employee_id,area_id,registration_date,is_deleted) VALUES('legalName',6,3,'1990-05-26',0);
    INSERT INTO personal_information(legal_name,employee_id,area_id,registration_date,is_deleted) VALUES('legalName',1,2,'1990-05-26',0);

    --Incident Type
    SET IDENTITY_INSERT [dbo].[incident_type] ON
    insert into incident_type (id, name, description, is_deleted) values (1, 'Critica', 'el trabajador se encuentra en peligro de muerte', 0)
    insert into incident_type (id, name, description, is_deleted) values (2, 'Alta', 'el trabajdor tendra baja medica por un largo tiempo', 0)
    insert into incident_type (id, name, description, is_deleted) values (3, 'Media', 'el trabajador faltara unos dias al trabajo', 0)
    insert into incident_type (id, name, description, is_deleted) values (4, 'Baja', 'el trabajador sufrio contuciones y no puede trabajar el resto de dia', 0)
    insert into incident_type (id, name, description, is_deleted) values (5, 'General', 'golpes y lesiones leves', 0)
    SET IDENTITY_INSERT [dbo].[incident_type] OFF

    --Insert lesion type
    SET IDENTITY_INSERT [dbo].[lesion_type] ON
    insert into lesion_type (id, type, description, is_deleted) values (1, 'Quemadura','desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (2, 'Fractura','desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (3, 'Luxacion','desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (4, 'Torcedura,esguince,desgarre muscular','desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (5, 'Conmocion,Trauma interno',' desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (6, 'Amputacion,enucleacion(expulsion o perdida del ojo)','desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (7, 'Golpe contucion o aplastamiento',' desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (8, 'Envenenamiento,intoxicacion,alergia','desc', 0)
    insert into lesion_type (id, type, description, is_deleted) values (9, 'Efecto de la electricidad','desc', 0)
    SET IDENTITY_INSERT [dbo].[lesion_type] OFF

    --Insert Accident Agent
    SET IDENTITY_INSERT [dbo].[incident_agent] ON
    insert into incident_agent (id, name, is_deleted) values (1, 'Maquinaria y,o equipos', 0)
    insert into incident_agent (id, name, is_deleted) values (2, 'Medios de transporte', 0)
    insert into incident_agent (id, name, is_deleted) values (3, 'Aparatos (otros)', 0)
    insert into incident_agent (id, name, is_deleted) values (4, 'Herramientas, implementos o utencilios', 0)
    insert into incident_agent (id, name, is_deleted) values (5, 'Conmocion,Trauma interno', 0)
    insert into incident_agent (id, name, is_deleted) values (6, 'Amputacion,enucleacion(expulsion o perdida del ojo)', 0)
    insert into incident_agent (id, name, is_deleted) values (7, 'Golpe contucion o aplastamiento', 0)
    insert into incident_agent (id, name, is_deleted) values (8, 'Envenenamiento,intoxicacion,alergia', 0)
    insert into incident_agent (id, name, is_deleted) values (9, 'Efecto de la electricidad', 0)
    SET IDENTITY_INSERT [dbo].[incident_agent] OFF

    --Responsability
    SET IDENTITY_INSERT [dbo].[responsibility] ON
    insert into responsibility (id, name,description,is_deleted, employee_type_id) values (1, 'name1','Description1',0, 4)
    insert into responsibility (id, name,description,is_deleted, employee_type_id) values (2, 'name2','Description2',0, 5)
    insert into responsibility (id, name,description,is_deleted, employee_type_id) values (3, 'name3','Description3',0, 3)
    SET IDENTITY_INSERT [dbo].[responsibility] OFF

    --insert incident
    SET IDENTITY_INSERT [dbo].[incident] ON
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (1,	'2017-06-01 21:36:54.567',	'Martes',	'parqueo',	'12:50',	'piernas',	0,	'EXTRA_HOURS',	1,	1,	1,	1)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (2,	'2017-06-01 21:36:54.567',	'Martes',	'parqueo',	'12:50',	'piernas',	0,	'EXTRA_HOURS',	1,	1,	1,	1)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (3,	'2015-06-02 23:36:54.567',	'Jueves',	'almac�n',	'08:50',	'cabeza, manos',	0,	'EXTRA_HOURS',	1,	2,	2,	2)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (4,	'2010-06-01 23:36:54.567',	'Viernes',	'trabajo con grua',	'12:50',	'espalda',	0,	'EXTRA_HOURS',	3,	3,	3,	3)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (5,	'2014-06-02 23:12:54.567',	'Miercoles', 'almac�n',	'10:50',	'cabeza, manos',	0,	'EXTRA_HOURS',	1,	3,	3,	2)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (6,	'2014-06-01 23:23:54.567',	'Martes',	'oficina',	'12:43',	'dedos',	0,	'EXTRA_HOURS',	2,	2,	2,	1)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (7,	'2012-06-02 23:36:54.567',	'Lunes',	'almac�n',	'12:02',	'cabeza, manos',	0,	'EXTRA_HOURS',	1,	1,	1,	2)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (8,	'2017-06-01 23:36:54.567',	'Martes',	'gradas',	'12:23',	'manos',	0,	'EXTRA_HOURS',	2,	2,	2,	1)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (9,	'2018-06-02 23:45:54.567',	'Martes',	'almac�n',	'12:12',	'estomago, manos',	0,	'EXTRA_HOURS',	3,	3,	3,	3)
    insert into incident (id, accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, incident_agent_id, employee_id, incident_type_id, lesion_type_id) VALUES (10,	'2014-06-01 23:55:54.567',	'Martes',	'subiendo al 2do piso',	'12:21',	'manos',	0,	'EXTRA_HOURS',	2,	2,	2,	2)
    SET IDENTITY_INSERT [dbo].[incident] OFF
  END TRY
  BEGIN CATCH
	PRINT 'IT HAD A PROBLEM, ROLLBACK TRANSACTION'
    IF @@TRANCOUNT > 0
      ROLLBACK  TRANSACTION;
  END CATCH;
IF @@TRANCOUNT > 0
  COMMIT TRANSACTION;
GO