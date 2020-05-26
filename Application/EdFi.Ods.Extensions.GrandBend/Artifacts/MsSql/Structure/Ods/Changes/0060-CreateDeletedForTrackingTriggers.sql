-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TRIGGER [grandbend].[grandbend_Applicant_TR_DeleteTracking] ON [grandbend].[Applicant] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_grandbend].[Applicant](ApplicantIdentifier, EducationOrganizationId, Id, ChangeVersion)
    SELECT  ApplicantIdentifier, EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [grandbend].[Applicant] ENABLE TRIGGER [grandbend_Applicant_TR_DeleteTracking]
GO


