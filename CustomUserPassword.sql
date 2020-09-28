CREATE TABLE IF NOT EXISTS dbo."CustomUserPassword"
(
     "CustomUserPasswordId"     INTEGER      GENERATED ALWAYS AS IDENTITY     NOT NULL,
     "Email"                    VARCHAR(255) COLLATE dbo.case_insensitive     NOT NULL,
     "UserPassword"             VARCHAR(50)  COLLATE dbo.case_insensitive     NOT NULL,
     "UserType"                 INTEGER                                       NOT NULL,
     "Enabled"                  BOOLEAN                                       NOT NULL     CONSTRAINT "DF_CustomUserPassword_Enabled"            DEFAULT (false),
     "DateCreated"              TIMESTAMP(3)                                  NOT NULL     CONSTRAINT "DF_CustomUserPassword_DateCreated"        DEFAULT (LOCALTIMESTAMP),
     "DateAmended"              TIMESTAMP(3)                                  NOT NULL     CONSTRAINT "DF_CustomUserPassword_DateAmended"        DEFAULT (LOCALTIMESTAMP),
     "CustomUserId"             INTEGER                                       NULL,
     "PreferredLocaleId"        VARCHAR(20)  COLLATE dbo.case_insensitive     NOT NULL     CONSTRAINT "DF_CustomUserPassword_PreferredLocaleId"  DEFAULT ('en-US'),
     CONSTRAINT "PK_CustomUserPassword" PRIMARY KEY 
     (
          "CustomUserPasswordId"
     )
);

CREATE UNIQUE INDEX IF NOT EXISTS "IX_CustomUserPassword_NU01" 
    ON dbo."CustomUserPassword"
    (
        "Email"
    );

CREATE INDEX IF NOT EXISTS "IX_CustomUserPassword_NC01" 
    ON dbo."CustomUserPassword"
    (
        "UserType",
        "CustomUserId" ASC NULLS FIRST 
    );
