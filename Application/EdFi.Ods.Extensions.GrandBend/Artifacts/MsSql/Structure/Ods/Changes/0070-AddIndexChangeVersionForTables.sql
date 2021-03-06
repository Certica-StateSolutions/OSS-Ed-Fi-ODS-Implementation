-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'grandbend.Applicant') AND name = N'UX_Applicant_ChangeVersion')
    CREATE INDEX [UX_Applicant_ChangeVersion] ON [grandbend].[Applicant] ([ChangeVersion] ASC)
    GO
COMMIT

