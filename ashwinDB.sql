use ashwin_db;

create table group_tbl(G_id Varchar(10) NOT NULL, primary key (G_id));
insert into group_tbl(G_id) values ("G1");
insert into group_tbl(G_id) values ("G2");

create table protein_tbl(P_id Varchar(10) NOT NULL, primary key (P_id));
insert into protein_tbl(P_id) values ("P1");
insert into protein_tbl(P_id) values ("P2");
insert into protein_tbl(P_id) values ("P3");
insert into protein_tbl(P_id) values ("P4");
insert into protein_tbl(P_id) values ("P5");
insert into protein_tbl(P_id) values ("P6");
insert into protein_tbl(P_id) values ("P7");
insert into protein_tbl(P_id) values ("P8");


create table sample_tbl(S_id varchar(10) not null,
                        G_id Varchar(10) NOT NULL,
						primary key(S_id), 
                        foreign key(G_id) references group_tbl(G_id));
 
insert into sample_tbl(S_id,G_id) values ("S1","G1"),("S2","G1"),("S3","G1"),("S4","G2"),
										 ("S5","G2"),("S6","G2"),
                                         ("SS1","G1"),("SS2","G1"),("SS3","G1"),("SS4","G1"),
                                         ("SS5","G2"),("SS6","G2"),("SS7","G2"),("SS8","G2");					

create table p_exprs(S_id varchar(10) not null,
                     foreign key (S_id) references sample_tbl(S_id),
                     P_id Varchar(10) NOT NULL,
					 foreign key (P_id) references protein_tbl(P_id),
                     expr decimal(20,10),
                     PRIMARY KEY (P_id,S_id)
                     );
                     
insert into p_exprs(P_id,S_id,expr) values ("P1","S1",1.01),
                                           ("P2","S1",9.25),
                                           ("P3","S1",4.28),
                                           ("P4","S1",7.98),
                                           ("P5","S1",107.84),
                                           ("P6","S1",88.71),
                                           ("P7","S1",0.04),
                                           ("P8","S1",0),
                                           ("P1","S2",1.05),
                                           ("P2","S2",1.03),
                                           ("P3","S2",0),
                                           ("P4","S2",5.39),
                                           ("P5","S2",101.11),
                                           ("P6","S2",115.14),
                                           ("P7","S2",0.10),
                                           ("P8","S2",0.76),
                                           ("P1","S3",1.12),
                                           ("P2","S3",9.61),
                                           ("P3","S3",9.80),
                                           ("P4","S3",5.16),
                                           ("P5","S3",73.67),
                                           ("P6","S3",141.70),
                                           ("P7","S3",0.54),
                                           ("P8","S3",0.13),
                                           ("P1","S4",2.13),
                                           ("P2","S4",7.46),
                                           ("P3","S4",6.17),
                                           ("P4","S4",1.27),
                                           ("P5","S4",113.94),
                                           ("P6","S4",99.91),
                                           ("P7","S4",0.80),
                                           ("P8","S4",0.82),
                                           ("P1","S5",2.25),
                                           ("P2","S5",8.37),
                                           ("P3","S5",0.70),
                                           ("P4","S5",8.71),
                                           ("P5","S5",108.48),
                                           ("P6","S5",118.70),
                                           ("P7","S5",0),
                                           ("P8","S5",0.73),
                                           ("P1","S6",2.33),
                                           ("P2","S6",0.81),
                                           ("P3","S6",0),
                                           ("P4","S6",8.66),
                                           ("P5","S6",77.48),
                                           ("P6","S6",110.62),
                                           ("P7","S6",0.31),
                                           ("P8","S6",0.33),
                                           ("P1","SS1",4.01),
                                           ("P2","SS1",113.94),
                                           ("P3","SS1",0),
                                           ("P4","SS1",100.68),
                                           ("P5","SS1",107.84),
                                           ("P6","SS1",103.22),
                                           ("P1","SS2",305.00),
										   ("P2","SS2",108.48),
										   ("P3","SS2",2.59),
										   ("P4","SS2",5.29),
										   ("P5","SS2",101.11),
										   ("P6","SS2",79.88),
									       ("P1","SS3",7.12),
                                           ("P2","SS3",9.61),
                                           ("P3","SS3",56.12),
                                           ("P4","SS3",5.16),
                                           ("P5","SS3",73.67),
                                           ("P1","SS4",2.93),
                                           ("P2","SS4",7.46),
                                           ("P3","SS4",34.89),
                                           ("P4","SS4",1.27),
                                           ("P5","SS4",10.32),
                                           ("P6","SS4",99.91),
                                           ("P1","SS5",0),
                                           ("P2","SS5",8.37),
                                           ("P3","SS5",0.70),
                                           ("P4","SS5",8.71),
                                           ("P5","SS5",19.45),
                                           ("P6","SS5",21.56),
                                           ("P1","SS6",10.33),
                                           ("P2","SS6",0.81),
                                           ("P3","SS6",9.51),
                                           ("P4","SS6",8.66),
                                           ("P5","SS6",0),
                                           ("P6","SS6",32.78),
                                           ("P1","SS7",7.98),
                                           ("P2","SS7",88.71),
                                           ("P3","SS7",9.25),
                                           ("P4","SS7",118.70),
                                           ("P5","SS7",88.65),
                                           ("P6","SS7",9.80),
                                           ("P1","SS8",5.39),
                                           ("P2","SS8",115.14),
                                           ("P3","SS8",1.03),
                                           ("P4","SS8",110.62),
                                           ("P5","SS8",108.34),
                                           ("P6","SS8",0);
                                           


select * from p_exprs;

