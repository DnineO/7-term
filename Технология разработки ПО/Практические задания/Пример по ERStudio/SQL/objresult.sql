/*
 * ER/Studio 3.0 SQL Code Generation
 * Company:      �������������������
 * Project:      ������� ����������������
 * Author:       ������, �����������
 *
 * Date Created: Saturday, January 20 2001 at 01:02 PM
 * Target DBMS : InterBase
 */

CREATE DATABASE "obj" USER "SYSDBA" PASSWORD "masterkey"
;
CONNECT "obj" USER "SYSDBA" PASSWORD "masterkey"
;
CREATE EXCEPTION ER_INSERT_ERR "Cannot insert because primary key value not found in parent"
;
CREATE EXCEPTION ER_DELETE_ERR "Cannot delete because foreign keys still exist in child"
;
CREATE EXCEPTION ER_UPDATE_ERR "Cannot update."
;

CREATE DOMAIN AM40 CHAR(40)
;

CREATE DOMAIN EXTRCONT DECIMAL(8,3)
;

CREATE DOMAIN FEDERALDISTRICT VARCHAR(40)
;

CREATE DOMAIN FLOATNOTNULL FLOAT
;

CREATE DOMAIN FLOATNULL FLOAT
;

CREATE DOMAIN IID INTEGER
DEFAULT default 1
;

CREATE DOMAIN INDMAST VARCHAR(35)
;

CREATE DOMAIN INTVAL0 INTEGER
DEFAULT DEFAULT 0
;

CREATE DOMAIN MEASUREUNIT VARCHAR(20)
;

CREATE DOMAIN OBJ VARCHAR(150)
;

CREATE DOMAIN OBJPLACE CHAR(60)
;

CREATE DOMAIN OBJSCALE VARCHAR(20)
;

CREATE DOMAIN OBJSTAT VARCHAR(21)
;

CREATE DOMAIN OBJTYPE CHAR(25)
;

CREATE DOMAIN OBJVALUE VARCHAR(35)
;

CREATE DOMAIN RECONMAST VARCHAR(20)
;

CREATE DOMAIN SID SMALLINT
;

CREATE DOMAIN STATENUMB VARCHAR(20)
;

CREATE DOMAIN STOCKRESCAT VARCHAR(20)
;

CREATE DOMAIN YEAR VARCHAR(20)
;

/* 
 * TABLE: FEDERALDISTRICT 
 */

CREATE TABLE FEDERALDISTRICT(
    FEDERALDISTRICTID    IID                NOT NULL,
    FEDERALDISTRICT      FEDERALDISTRICT,
    CONSTRAINT RDB$PRIMARY53 PRIMARY KEY (FEDERALDISTRICTID)
) 
;


/* 
 * TABLE: INDMAST 
 */

CREATE TABLE INDMAST(
    INDMASTID    IID        NOT NULL,
    INDMAST      INDMAST,
    CONSTRAINT RDB$PRIMARY35 PRIMARY KEY (INDMASTID)
) 
;


/* 
 * TABLE: MEASUREUNIT 
 */

CREATE TABLE MEASUREUNIT(
    MEASUREUNITID    IID            NOT NULL,
    MEASUREUNIT      MEASUREUNIT,
    CONSTRAINT RDB$PRIMARY42 PRIMARY KEY (MEASUREUNITID)
) 
;


/* 
 * TABLE: OBJ 
 */

CREATE TABLE OBJ(
    OBJID                IID             NOT NULL,
    RESID                SID             NOT NULL,
    OBJSTATID            IID             NOT NULL,
    OBJTYPEID            SID             NOT NULL,
    OBJSCALEID           IID             NOT NULL,
    OBJVALUEID           IID             NOT NULL,
    INDMASTID            IID             NOT NULL,
    RECONMASTID          IID             NOT NULL,
    SUBRFID              SID             NOT NULL,
    FEDERALDISTRICTID    IID             NOT NULL,
    OBJ                  OBJ,
    SQUARE               INTVAL0,
    SG                   FLOATNOTNULL,
    SM                   FLOATNOTNULL,
    SS                   FLOATNULL,
    DG                   FLOATNOTNULL,
    DM                   FLOATNULL,
    DS                   FLOATNULL,
    STATENUMB            STATENUMB,
    CONSTRAINT RDB$PRIMARY18 PRIMARY KEY (OBJID), 
    FOREIGN KEY (FEDERALDISTRICTID)
    REFERENCES FEDERALDISTRICT(FEDERALDISTRICTID),
    FOREIGN KEY (SUBRFID)
    REFERENCES SUBRF(SUBRFID),
    FOREIGN KEY (RECONMASTID)
    REFERENCES RECONMAST(RECONMASTID),
    FOREIGN KEY (INDMASTID)
    REFERENCES INDMAST(INDMASTID),
    FOREIGN KEY (OBJVALUEID)
    REFERENCES OBJVALUE(OBJVALUEID),
    FOREIGN KEY (OBJSCALEID)
    REFERENCES OBJSCALE(OBJSCALEID),
    FOREIGN KEY (OBJTYPEID)
    REFERENCES OBJTYPE(OBJTYPEID),
    FOREIGN KEY (OBJSTATID)
    REFERENCES OBJSTAT(OBJSTATID),
    CONSTRAINT FK_OBJ_RES FOREIGN KEY (RESID)
    REFERENCES RES(RESID)
) 
;


/* 
 * TABLE: OBJ_RES 
 */

CREATE TABLE OBJ_RES(
    OBJID    IID    NOT NULL,
    RESID    SID    NOT NULL,
    CONSTRAINT PK26 PRIMARY KEY (OBJID,RESID), 
    FOREIGN KEY (OBJID)
    REFERENCES OBJ(OBJID),
    FOREIGN KEY (RESID)
    REFERENCES RES(RESID)
) 
;


/* 
 * TABLE: OBJSCALE 
 */

CREATE TABLE OBJSCALE(
    OBJSCALEID    IID         NOT NULL,
    OBJSCALE      OBJSCALE,
    CONSTRAINT RDB$PRIMARY40 PRIMARY KEY (OBJSCALEID)
) 
;


/* 
 * TABLE: OBJSTAT 
 */

CREATE TABLE OBJSTAT(
    OBJSTATID    IID        NOT NULL,
    OBJSTAT      OBJSTAT,
    CONSTRAINT RDB$PRIMARY39 PRIMARY KEY (OBJSTATID)
) 
;


/* 
 * TABLE: OBJTYPE 
 */

CREATE TABLE OBJTYPE(
    OBJTYPEID    SID        NOT NULL,
    OBJTYPE      OBJTYPE    NOT NULL,
    CONSTRAINT RDB$PRIMARY10 PRIMARY KEY (OBJTYPEID)
) 
;


/* 
 * TABLE: OBJVALUE 
 */

CREATE TABLE OBJVALUE(
    OBJVALUEID    IID         NOT NULL,
    OBJVALUE      OBJVALUE,
    CONSTRAINT RDB$PRIMARY41 PRIMARY KEY (OBJVALUEID)
) 
;


/* 
 * TABLE: RECONMAST 
 */

CREATE TABLE RECONMAST(
    RECONMASTID    IID          NOT NULL,
    RECONMAST      RECONMAST,
    CONSTRAINT RDB$PRIMARY36 PRIMARY KEY (RECONMASTID)
) 
;


/* 
 * TABLE: RES 
 */

CREATE TABLE RES(
    RESID         SID     NOT NULL,
    RESGROUPID    SID     NOT NULL,
    RES           AM40    NOT NULL,
    CONSTRAINT RDB$PRIMARY32 PRIMARY KEY (RESID), 
    FOREIGN KEY (RESGROUPID)
    REFERENCES RESGROUP(RESGROUPID)
) 
;


/* 
 * TABLE: RESGROUP 
 */

CREATE TABLE RESGROUP(
    RESGROUPID    SID     NOT NULL,
    RESGROUP      AM40    NOT NULL,
    CONSTRAINT RDB$PRIMARY38 PRIMARY KEY (RESGROUPID)
) 
;


/* 
 * TABLE: STOCKRES 
 */

CREATE TABLE STOCKRES(
    STOCKRESYEAR     YEAR        NOT NULL,
    STOCKRESCATID    IID         NOT NULL,
    RESID            SID         NOT NULL,
    OBJID            IID         NOT NULL,
    MEASUREUNITID    IID         NOT NULL,
    CONTENTS         EXTRCONT    NOT NULL,
    STOCKRESVALUE    EXTRCONT    NOT NULL,
    CONSTRAINT RDB$PRIMARY97 PRIMARY KEY (STOCKRESYEAR,STOCKRESCATID,RESID,OBJID), 
    FOREIGN KEY (STOCKRESCATID)
    REFERENCES STOCKRESCAT(STOCKRESCATID),
    FOREIGN KEY (MEASUREUNITID)
    REFERENCES MEASUREUNIT(MEASUREUNITID),
    FOREIGN KEY (RESID)
    REFERENCES RES(RESID),
    FOREIGN KEY (OBJID)
    REFERENCES OBJ(OBJID)
) 
;


/* 
 * TABLE: STOCKRESCAT 
 */

CREATE TABLE STOCKRESCAT(
    STOCKRESCATID    IID            NOT NULL,
    STOCKRESCAT      STOCKRESCAT,
    CONSTRAINT RDB$PRIMARY94 PRIMARY KEY (STOCKRESCATID)
) 
;


/* 
 * TABLE: SUBRF 
 */

CREATE TABLE SUBRF(
    SUBRFID    SID     NOT NULL,
    SUBRF      AM40    NOT NULL,
    CONSTRAINT RDB$PRIMARY17 PRIMARY KEY (SUBRFID)
) 
;

