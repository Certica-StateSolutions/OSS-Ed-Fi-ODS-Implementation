-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table [tpdm].[AidTypeDescriptor] --
CREATE TABLE [tpdm].[AidTypeDescriptor] (
    [AidTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AidTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AidTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[AnonymizedStudent] --
CREATE TABLE [tpdm].[AnonymizedStudent] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SexDescriptorId] [INT] NULL,
    [GenderDescriptorId] [INT] NULL,
    [HispanicLatinoEthnicity] [BIT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [Section504Enrollment] [BIT] NULL,
    [ELLEnrollment] [BIT] NULL,
    [ESLEnrollment] [BIT] NULL,
    [SPEDEnrollment] [BIT] NULL,
    [TitleIEnrollment] [BIT] NULL,
    [AtriskIndicator] [BIT] NULL,
    [Mobility] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudent_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudent] ADD CONSTRAINT [AnonymizedStudent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudent] ADD CONSTRAINT [AnonymizedStudent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudent] ADD CONSTRAINT [AnonymizedStudent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentAcademicRecord] --
CREATE TABLE [tpdm].[AnonymizedStudentAcademicRecord] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [SessionGradePointAverage] [DECIMAL](18, 4) NULL,
    [CumulativeGradePointAverage] [DECIMAL](18, 4) NULL,
    [GPAMax] [DECIMAL](18, 4) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentAcademicRecord_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] ADD CONSTRAINT [AnonymizedStudentAcademicRecord_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] ADD CONSTRAINT [AnonymizedStudentAcademicRecord_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] ADD CONSTRAINT [AnonymizedStudentAcademicRecord_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentAssessment] --
CREATE TABLE [tpdm].[AnonymizedStudentAssessment] (
    [AdministrationDate] [DATE] NOT NULL,
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NULL,
    [AssessmentTitle] [NVARCHAR](100) NULL,
    [AssessmentCategoryDescriptorId] [INT] NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentAssessment_PK] PRIMARY KEY CLUSTERED (
        [AdministrationDate] ASC,
        [AnonymizedStudentIdentifier] ASC,
        [AssessmentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessment] ADD CONSTRAINT [AnonymizedStudentAssessment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessment] ADD CONSTRAINT [AnonymizedStudentAssessment_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessment] ADD CONSTRAINT [AnonymizedStudentAssessment_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentAssessmentCourseAssociation] --
CREATE TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] (
    [AdministrationDate] [DATE] NOT NULL,
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentAssessmentCourseAssociation_PK] PRIMARY KEY CLUSTERED (
        [AdministrationDate] ASC,
        [AnonymizedStudentIdentifier] ASC,
        [AssessmentIdentifier] ASC,
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ADD CONSTRAINT [AnonymizedStudentAssessmentCourseAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ADD CONSTRAINT [AnonymizedStudentAssessmentCourseAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ADD CONSTRAINT [AnonymizedStudentAssessmentCourseAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] --
CREATE TABLE [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] (
    [AdministrationDate] [DATE] NOT NULL,
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [PerformanceLevelMet] [BIT] NOT NULL,
    [PerformanceLevelDescriptorId] [INT] NOT NULL,
    [AssessmentReportingMethodDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentAssessmentPerformanceLevel_PK] PRIMARY KEY CLUSTERED (
        [AdministrationDate] ASC,
        [AnonymizedStudentIdentifier] ASC,
        [AssessmentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] ADD CONSTRAINT [AnonymizedStudentAssessmentPerformanceLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentAssessmentScoreResult] --
CREATE TABLE [tpdm].[AnonymizedStudentAssessmentScoreResult] (
    [AdministrationDate] [DATE] NOT NULL,
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [Result] [NVARCHAR](35) NOT NULL,
    [ResultDatatypeTypeDescriptorId] [INT] NOT NULL,
    [AssessmentReportingMethodDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentAssessmentScoreResult_PK] PRIMARY KEY CLUSTERED (
        [AdministrationDate] ASC,
        [AnonymizedStudentIdentifier] ASC,
        [AssessmentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentScoreResult] ADD CONSTRAINT [AnonymizedStudentAssessmentScoreResult_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentAssessmentSectionAssociation] --
CREATE TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] (
    [AdministrationDate] [DATE] NOT NULL,
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentAssessmentSectionAssociation_PK] PRIMARY KEY CLUSTERED (
        [AdministrationDate] ASC,
        [AnonymizedStudentIdentifier] ASC,
        [AssessmentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ADD CONSTRAINT [AnonymizedStudentAssessmentSectionAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ADD CONSTRAINT [AnonymizedStudentAssessmentSectionAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ADD CONSTRAINT [AnonymizedStudentAssessmentSectionAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentCourseAssociation] --
CREATE TABLE [tpdm].[AnonymizedStudentCourseAssociation] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentCourseAssociation_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [BeginDate] ASC,
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] ADD CONSTRAINT [AnonymizedStudentCourseAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] ADD CONSTRAINT [AnonymizedStudentCourseAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] ADD CONSTRAINT [AnonymizedStudentCourseAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentCourseTranscript] --
CREATE TABLE [tpdm].[AnonymizedStudentCourseTranscript] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [FinalLetterGradeEarned] [NVARCHAR](20) NULL,
    [FinalNumericGradeEarned] [DECIMAL](9, 2) NULL,
    [CourseRepeatCodeDescriptorId] [INT] NULL,
    [CourseTitle] [NVARCHAR](60) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentCourseTranscript_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] ADD CONSTRAINT [AnonymizedStudentCourseTranscript_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] ADD CONSTRAINT [AnonymizedStudentCourseTranscript_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] ADD CONSTRAINT [AnonymizedStudentCourseTranscript_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentDisability] --
CREATE TABLE [tpdm].[AnonymizedStudentDisability] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [DisabilityDescriptorId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [DisabilityDiagnosis] [NVARCHAR](80) NULL,
    [OrderOfDisability] [INT] NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentDisability_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [DisabilityDescriptorId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentDisability] ADD CONSTRAINT [AnonymizedStudentDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentDisabilityDesignation] --
CREATE TABLE [tpdm].[AnonymizedStudentDisabilityDesignation] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [DisabilityDescriptorId] [INT] NOT NULL,
    [DisabilityDesignationDescriptorId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentDisabilityDesignation_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [DisabilityDescriptorId] ASC,
        [DisabilityDesignationDescriptorId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentDisabilityDesignation] ADD CONSTRAINT [AnonymizedStudentDisabilityDesignation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentEducationOrganizationAssociation] --
CREATE TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentEducationOrganizationAssociation_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ADD CONSTRAINT [AnonymizedStudentEducationOrganizationAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ADD CONSTRAINT [AnonymizedStudentEducationOrganizationAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ADD CONSTRAINT [AnonymizedStudentEducationOrganizationAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[AnonymizedStudentLanguage] --
CREATE TABLE [tpdm].[AnonymizedStudentLanguage] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentLanguage_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [LanguageDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentLanguage] ADD CONSTRAINT [AnonymizedStudentLanguage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentLanguageUse] --
CREATE TABLE [tpdm].[AnonymizedStudentLanguageUse] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [LanguageUseDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentLanguageUse_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [LanguageDescriptorId] ASC,
        [LanguageUseDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentLanguageUse] ADD CONSTRAINT [AnonymizedStudentLanguageUse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentRace] --
CREATE TABLE [tpdm].[AnonymizedStudentRace] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AnonymizedStudentRace_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [FactsAsOfDate] ASC,
        [RaceDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentRace] ADD CONSTRAINT [AnonymizedStudentRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AnonymizedStudentSectionAssociation] --
CREATE TABLE [tpdm].[AnonymizedStudentSectionAssociation] (
    [AnonymizedStudentIdentifier] [NVARCHAR](60) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AnonymizedStudentSectionAssociation_PK] PRIMARY KEY CLUSTERED (
        [AnonymizedStudentIdentifier] ASC,
        [BeginDate] ASC,
        [FactsAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] ADD CONSTRAINT [AnonymizedStudentSectionAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] ADD CONSTRAINT [AnonymizedStudentSectionAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] ADD CONSTRAINT [AnonymizedStudentSectionAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[Applicant] --
CREATE TABLE [tpdm].[Applicant] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PersonalTitlePrefix] [NVARCHAR](30) NULL,
    [FirstName] [NVARCHAR](75) NOT NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [MaidenName] [NVARCHAR](75) NULL,
    [SexDescriptorId] [INT] NULL,
    [BirthDate] [DATE] NULL,
    [HispanicLatinoEthnicity] [BIT] NULL,
    [CitizenshipStatusDescriptorId] [INT] NULL,
    [HighestCompletedLevelOfEducationDescriptorId] [INT] NULL,
    [YearsOfPriorProfessionalExperience] [DECIMAL](5, 2) NULL,
    [YearsOfPriorTeachingExperience] [DECIMAL](5, 2) NULL,
    [LoginId] [NVARCHAR](60) NULL,
    [HighlyQualifiedTeacher] [BIT] NULL,
    [HighlyQualifiedAcademicSubjectDescriptorId] [INT] NULL,
    [GenderDescriptorId] [INT] NULL,
    [EconomicDisadvantaged] [BIT] NULL,
    [FirstGenerationStudent] [BIT] NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Applicant_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[Applicant] ADD CONSTRAINT [Applicant_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[Applicant] ADD CONSTRAINT [Applicant_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[Applicant] ADD CONSTRAINT [Applicant_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ApplicantAddress] --
CREATE TABLE [tpdm].[ApplicantAddress] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [ApartmentRoomSuiteNumber] [NVARCHAR](50) NULL,
    [BuildingSiteNumber] [NVARCHAR](20) NULL,
    [NameOfCounty] [NVARCHAR](30) NULL,
    [CountyFIPSCode] [NVARCHAR](5) NULL,
    [Latitude] [NVARCHAR](20) NULL,
    [Longitude] [NVARCHAR](20) NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CongressionalDistrict] [NVARCHAR](30) NULL,
    [LocaleDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantAddress_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [ApplicantIdentifier] ASC,
        [City] ASC,
        [EducationOrganizationId] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantAddress] ADD CONSTRAINT [ApplicantAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantAddressPeriod] --
CREATE TABLE [tpdm].[ApplicantAddressPeriod] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantAddressPeriod_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [ApplicantIdentifier] ASC,
        [BeginDate] ASC,
        [City] ASC,
        [EducationOrganizationId] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantAddressPeriod] ADD CONSTRAINT [ApplicantAddressPeriod_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantAid] --
CREATE TABLE [tpdm].[ApplicantAid] (
    [AidTypeDescriptorId] [INT] NOT NULL,
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [EndDate] [DATE] NULL,
    [AidConditionDescription] [NVARCHAR](1024) NULL,
    [AidAmount] [MONEY] NULL,
    [PellGrantRecipient] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantAid_PK] PRIMARY KEY CLUSTERED (
        [AidTypeDescriptorId] ASC,
        [ApplicantIdentifier] ASC,
        [BeginDate] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantAid] ADD CONSTRAINT [ApplicantAid_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantBackgroundCheck] --
CREATE TABLE [tpdm].[ApplicantBackgroundCheck] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [BackgroundCheckTypeDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [BackgroundCheckRequestedDate] [DATE] NOT NULL,
    [BackgroundCheckStatusDescriptorId] [INT] NULL,
    [BackgroundCheckCompletedDate] [DATE] NULL,
    [Fingerprint] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantBackgroundCheck_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [BackgroundCheckTypeDescriptorId] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantBackgroundCheck] ADD CONSTRAINT [ApplicantBackgroundCheck_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantCharacteristic] --
CREATE TABLE [tpdm].[ApplicantCharacteristic] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentCharacteristicDescriptorId] [INT] NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [DesignatedBy] [NVARCHAR](60) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantCharacteristic_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [StudentCharacteristicDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantCharacteristic] ADD CONSTRAINT [ApplicantCharacteristic_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantCredential] --
CREATE TABLE [tpdm].[ApplicantCredential] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantCredential_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [CredentialIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantCredential] ADD CONSTRAINT [ApplicantCredential_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantDisability] --
CREATE TABLE [tpdm].[ApplicantDisability] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [DisabilityDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [DisabilityDiagnosis] [NVARCHAR](80) NULL,
    [OrderOfDisability] [INT] NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantDisability_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [DisabilityDescriptorId] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantDisability] ADD CONSTRAINT [ApplicantDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantDisabilityDesignation] --
CREATE TABLE [tpdm].[ApplicantDisabilityDesignation] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [DisabilityDescriptorId] [INT] NOT NULL,
    [DisabilityDesignationDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantDisabilityDesignation_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [DisabilityDescriptorId] ASC,
        [DisabilityDesignationDescriptorId] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantDisabilityDesignation] ADD CONSTRAINT [ApplicantDisabilityDesignation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantElectronicMail] --
CREATE TABLE [tpdm].[ApplicantElectronicMail] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ElectronicMailAddress] [NVARCHAR](128) NOT NULL,
    [ElectronicMailTypeDescriptorId] [INT] NOT NULL,
    [PrimaryEmailAddressIndicator] [BIT] NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantElectronicMail_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [ElectronicMailAddress] ASC,
        [ElectronicMailTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantElectronicMail] ADD CONSTRAINT [ApplicantElectronicMail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantGradePointAverage] --
CREATE TABLE [tpdm].[ApplicantGradePointAverage] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [GradePointAverageTypeDescriptorId] [INT] NOT NULL,
    [IsCumulative] [BIT] NULL,
    [GradePointAverageValue] [DECIMAL](18, 4) NOT NULL,
    [MaxGradePointAverageValue] [DECIMAL](18, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [GradePointAverageTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantGradePointAverage] ADD CONSTRAINT [ApplicantGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantIdentificationDocument] --
CREATE TABLE [tpdm].[ApplicantIdentificationDocument] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [IdentificationDocumentUseDescriptorId] [INT] NOT NULL,
    [PersonalInformationVerificationDescriptorId] [INT] NOT NULL,
    [DocumentTitle] [NVARCHAR](60) NULL,
    [DocumentExpirationDate] [DATE] NULL,
    [IssuerDocumentIdentificationCode] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerCountryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantIdentificationDocument_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [IdentificationDocumentUseDescriptorId] ASC,
        [PersonalInformationVerificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantIdentificationDocument] ADD CONSTRAINT [ApplicantIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantInternationalAddress] --
CREATE TABLE [tpdm].[ApplicantInternationalAddress] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [AddressLine1] [NVARCHAR](150) NOT NULL,
    [AddressLine2] [NVARCHAR](150) NULL,
    [AddressLine3] [NVARCHAR](150) NULL,
    [AddressLine4] [NVARCHAR](150) NULL,
    [CountryDescriptorId] [INT] NOT NULL,
    [Latitude] [NVARCHAR](20) NULL,
    [Longitude] [NVARCHAR](20) NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantInternationalAddress_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantInternationalAddress] ADD CONSTRAINT [ApplicantInternationalAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantLanguage] --
CREATE TABLE [tpdm].[ApplicantLanguage] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantLanguage_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [LanguageDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantLanguage] ADD CONSTRAINT [ApplicantLanguage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantLanguageUse] --
CREATE TABLE [tpdm].[ApplicantLanguageUse] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [LanguageUseDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantLanguageUse_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [LanguageDescriptorId] ASC,
        [LanguageUseDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantLanguageUse] ADD CONSTRAINT [ApplicantLanguageUse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantPersonalIdentificationDocument] --
CREATE TABLE [tpdm].[ApplicantPersonalIdentificationDocument] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [IdentificationDocumentUseDescriptorId] [INT] NOT NULL,
    [PersonalInformationVerificationDescriptorId] [INT] NOT NULL,
    [DocumentTitle] [NVARCHAR](60) NULL,
    [DocumentExpirationDate] [DATE] NULL,
    [IssuerDocumentIdentificationCode] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerCountryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantPersonalIdentificationDocument_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [IdentificationDocumentUseDescriptorId] ASC,
        [PersonalInformationVerificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantPersonalIdentificationDocument] ADD CONSTRAINT [ApplicantPersonalIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantProspectAssociation] --
CREATE TABLE [tpdm].[ApplicantProspectAssociation] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ApplicantProspectAssociation_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantProspectAssociation] ADD CONSTRAINT [ApplicantProspectAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[ApplicantProspectAssociation] ADD CONSTRAINT [ApplicantProspectAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[ApplicantProspectAssociation] ADD CONSTRAINT [ApplicantProspectAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ApplicantRace] --
CREATE TABLE [tpdm].[ApplicantRace] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantRace_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [RaceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantRace] ADD CONSTRAINT [ApplicantRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantScoreResult] --
CREATE TABLE [tpdm].[ApplicantScoreResult] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [AssessmentReportingMethodDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [Result] [NVARCHAR](35) NOT NULL,
    [ResultDatatypeTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantScoreResult_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [AssessmentReportingMethodDescriptorId] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantScoreResult] ADD CONSTRAINT [ApplicantScoreResult_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantStaffIdentificationCode] --
CREATE TABLE [tpdm].[ApplicantStaffIdentificationCode] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffIdentificationSystemDescriptorId] [INT] NOT NULL,
    [IdentificationCode] [NVARCHAR](60) NOT NULL,
    [AssigningOrganizationIdentificationCode] [NVARCHAR](60) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantStaffIdentificationCode_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [StaffIdentificationSystemDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantStaffIdentificationCode] ADD CONSTRAINT [ApplicantStaffIdentificationCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantTeacherPreparationProgram] --
CREATE TABLE [tpdm].[ApplicantTeacherPreparationProgram] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [TeacherPreparationProgramName] [NVARCHAR](255) NOT NULL,
    [TeacherPreparationProgramIdentifier] [NVARCHAR](75) NULL,
    [TeacherPreparationProgramTypeDescriptorId] [INT] NOT NULL,
    [NameOfInstitution] [NVARCHAR](75) NOT NULL,
    [MajorSpecialization] [NVARCHAR](75) NOT NULL,
    [GPA] [DECIMAL](18, 4) NULL,
    [LevelOfDegreeAwardedDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantTeacherPreparationProgram_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [TeacherPreparationProgramName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantTeacherPreparationProgram] ADD CONSTRAINT [ApplicantTeacherPreparationProgram_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantTelephone] --
CREATE TABLE [tpdm].[ApplicantTelephone] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [TelephoneNumber] [NVARCHAR](24) NOT NULL,
    [TelephoneNumberTypeDescriptorId] [INT] NOT NULL,
    [OrderOfPriority] [INT] NULL,
    [TextMessageCapabilityIndicator] [BIT] NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantTelephone_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [TelephoneNumber] ASC,
        [TelephoneNumberTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantTelephone] ADD CONSTRAINT [ApplicantTelephone_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicantVisa] --
CREATE TABLE [tpdm].[ApplicantVisa] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [VisaDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantVisa_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [VisaDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicantVisa] ADD CONSTRAINT [ApplicantVisa_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[Application] --
CREATE TABLE [tpdm].[Application] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [ApplicationIdentifier] [NVARCHAR](20) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ApplicationDate] [DATE] NOT NULL,
    [ApplicationStatusDescriptorId] [INT] NOT NULL,
    [CurrentEmployee] [BIT] NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [AcceptedDate] [DATE] NULL,
    [ApplicationSourceDescriptorId] [INT] NULL,
    [FirstContactDate] [DATE] NULL,
    [HighNeedsAcademicSubjectDescriptorId] [INT] NULL,
    [HireStatusDescriptorId] [INT] NULL,
    [HiringSourceDescriptorId] [INT] NULL,
    [WithdrawDate] [DATE] NULL,
    [WithdrawReasonDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Application_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [ApplicationIdentifier] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[Application] ADD CONSTRAINT [Application_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[Application] ADD CONSTRAINT [Application_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[Application] ADD CONSTRAINT [Application_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ApplicationEvent] --
CREATE TABLE [tpdm].[ApplicationEvent] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [ApplicationEventTypeDescriptorId] [INT] NOT NULL,
    [ApplicationIdentifier] [NVARCHAR](20) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [SequenceNumber] [INT] NOT NULL,
    [EventEndDate] [DATE] NULL,
    [ApplicationEvaluationScore] [DECIMAL](36, 18) NULL,
    [ApplicationEventResultDescriptorId] [INT] NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ApplicationEvent_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [ApplicationEventTypeDescriptorId] ASC,
        [ApplicationIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [EventDate] ASC,
        [SequenceNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicationEvent] ADD CONSTRAINT [ApplicationEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[ApplicationEvent] ADD CONSTRAINT [ApplicationEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[ApplicationEvent] ADD CONSTRAINT [ApplicationEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ApplicationEventResultDescriptor] --
CREATE TABLE [tpdm].[ApplicationEventResultDescriptor] (
    [ApplicationEventResultDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ApplicationEventResultDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ApplicationEventResultDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ApplicationEventTypeDescriptor] --
CREATE TABLE [tpdm].[ApplicationEventTypeDescriptor] (
    [ApplicationEventTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ApplicationEventTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ApplicationEventTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ApplicationOpenStaffPosition] --
CREATE TABLE [tpdm].[ApplicationOpenStaffPosition] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [ApplicationIdentifier] [NVARCHAR](20) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [RequisitionNumber] [NVARCHAR](20) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicationOpenStaffPosition_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [ApplicationIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [RequisitionNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicationOpenStaffPosition] ADD CONSTRAINT [ApplicationOpenStaffPosition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ApplicationSourceDescriptor] --
CREATE TABLE [tpdm].[ApplicationSourceDescriptor] (
    [ApplicationSourceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ApplicationSourceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ApplicationSourceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ApplicationStatusDescriptor] --
CREATE TABLE [tpdm].[ApplicationStatusDescriptor] (
    [ApplicationStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ApplicationStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ApplicationStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ApplicationTerm] --
CREATE TABLE [tpdm].[ApplicationTerm] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [ApplicationIdentifier] [NVARCHAR](20) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicationTerm_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [ApplicationIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ApplicationTerm] ADD CONSTRAINT [ApplicationTerm_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[AssessmentExtension] --
CREATE TABLE [tpdm].[AssessmentExtension] (
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [Namespace] [NVARCHAR](255) NOT NULL,
    [ProgramGatewayDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [AssessmentExtension_PK] PRIMARY KEY CLUSTERED (
        [AssessmentIdentifier] ASC,
        [Namespace] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[AssessmentExtension] ADD CONSTRAINT [AssessmentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[BackgroundCheckStatusDescriptor] --
CREATE TABLE [tpdm].[BackgroundCheckStatusDescriptor] (
    [BackgroundCheckStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [BackgroundCheckStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [BackgroundCheckStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[BackgroundCheckTypeDescriptor] --
CREATE TABLE [tpdm].[BackgroundCheckTypeDescriptor] (
    [BackgroundCheckTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [BackgroundCheckTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [BackgroundCheckTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[BoardCertificationTypeDescriptor] --
CREATE TABLE [tpdm].[BoardCertificationTypeDescriptor] (
    [BoardCertificationTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [BoardCertificationTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [BoardCertificationTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[CertificationExamStatusDescriptor] --
CREATE TABLE [tpdm].[CertificationExamStatusDescriptor] (
    [CertificationExamStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificationExamStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificationExamStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[CertificationExamTypeDescriptor] --
CREATE TABLE [tpdm].[CertificationExamTypeDescriptor] (
    [CertificationExamTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificationExamTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificationExamTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[CommunityOrganizationExtension] --
CREATE TABLE [tpdm].[CommunityOrganizationExtension] (
    [CommunityOrganizationId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CommunityOrganizationExtension_PK] PRIMARY KEY CLUSTERED (
        [CommunityOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CommunityOrganizationExtension] ADD CONSTRAINT [CommunityOrganizationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CommunityProviderExtension] --
CREATE TABLE [tpdm].[CommunityProviderExtension] (
    [CommunityProviderId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CommunityProviderExtension_PK] PRIMARY KEY CLUSTERED (
        [CommunityProviderId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CommunityProviderExtension] ADD CONSTRAINT [CommunityProviderExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CompleterAsStaffAssociation] --
CREATE TABLE [tpdm].[CompleterAsStaffAssociation] (
    [StaffUSI] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CompleterAsStaffAssociation_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CompleterAsStaffAssociation] ADD CONSTRAINT [CompleterAsStaffAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[CompleterAsStaffAssociation] ADD CONSTRAINT [CompleterAsStaffAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[CompleterAsStaffAssociation] ADD CONSTRAINT [CompleterAsStaffAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[CoteachingStyleObservedDescriptor] --
CREATE TABLE [tpdm].[CoteachingStyleObservedDescriptor] (
    [CoteachingStyleObservedDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CoteachingStyleObservedDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CoteachingStyleObservedDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[CourseCourseTranscriptFacts] --
CREATE TABLE [tpdm].[CourseCourseTranscriptFacts] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [CourseTitle] [NVARCHAR](60) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CourseCourseTranscriptFacts_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseCourseTranscriptFacts] ADD CONSTRAINT [CourseCourseTranscriptFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[CourseCourseTranscriptFacts] ADD CONSTRAINT [CourseCourseTranscriptFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[CourseCourseTranscriptFacts] ADD CONSTRAINT [CourseCourseTranscriptFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned] --
CREATE TABLE [tpdm].[CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [FinalLetterGrade] [NVARCHAR](20) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [LetterGradeTypeNumber] [INT] NULL,
    [LetterGradeTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [FinalLetterGrade] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned] ADD CONSTRAINT [CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseCourseTranscriptFactsAggregatedNumericGradeEarned] --
CREATE TABLE [tpdm].[CourseCourseTranscriptFactsAggregatedNumericGradeEarned] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AverageFinalNumericGradeEarned] [DECIMAL](9, 2) NOT NULL,
    [NumericGradeNCount] [INT] NULL,
    [NumericGradeStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseCourseTranscriptFactsAggregatedNumericGradeEarned_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseCourseTranscriptFactsAggregatedNumericGradeEarned] ADD CONSTRAINT [CourseCourseTranscriptFactsAggregatedNumericGradeEarned_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseCourseTranscriptFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[CourseCourseTranscriptFactsStudentsEnrolled] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseCourseTranscriptFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseCourseTranscriptFactsStudentsEnrolled] ADD CONSTRAINT [CourseCourseTranscriptFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentAcademicRecordFacts] --
CREATE TABLE [tpdm].[CourseStudentAcademicRecordFacts] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AggregatedGPAMax] [DECIMAL](18, 4) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CourseStudentAcademicRecordFacts_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] ADD CONSTRAINT [CourseStudentAcademicRecordFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] ADD CONSTRAINT [CourseStudentAcademicRecordFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] ADD CONSTRAINT [CourseStudentAcademicRecordFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] --
CREATE TABLE [tpdm].[CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [GradePointAverage] [DECIMAL](18, 4) NOT NULL,
    [GradePointNCount] [INT] NULL,
    [GradePointStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] ADD CONSTRAINT [CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage] --
CREATE TABLE [tpdm].[CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [GradePointAverage] [DECIMAL](18, 4) NOT NULL,
    [GradePointNCount] [INT] NULL,
    [GradePointStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage] ADD CONSTRAINT [CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentAcademicRecordFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[CourseStudentAcademicRecordFactsStudentsEnrolled] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentAcademicRecordFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsStudentsEnrolled] ADD CONSTRAINT [CourseStudentAcademicRecordFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentAssessmentFacts] --
CREATE TABLE [tpdm].[CourseStudentAssessmentFacts] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [AssessmentTitle] [NVARCHAR](100) NULL,
    [AssessmentCategoryDescriptorId] [INT] NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [AdministrationDate] [DATE] NULL,
    [TermDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CourseStudentAssessmentFacts_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] ADD CONSTRAINT [CourseStudentAssessmentFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] ADD CONSTRAINT [CourseStudentAssessmentFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] ADD CONSTRAINT [CourseStudentAssessmentFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] --
CREATE TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [PerformanceLevelDescriptorId] [INT] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [PerformanceLevelMetNumber] [INT] NULL,
    [PerformanceLevelMetPercentage] [DECIMAL](5, 4) NULL,
    [PerformanceLevelTypeNumber] [INT] NULL,
    [PerformanceLevelTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentAssessmentFactsAggregatedPerformanceLevel_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [PerformanceLevelDescriptorId] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] ADD CONSTRAINT [CourseStudentAssessmentFactsAggregatedPerformanceLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] --
CREATE TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [AssessmentReportingMethodDescriptorId] [INT] NOT NULL,
    [AverageScoreResultDatatypeTypeDescriptorId] [INT] NOT NULL,
    [AverageScoreResult] [NVARCHAR](35) NOT NULL,
    [ScoreNCount] [INT] NULL,
    [ScoreStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentAssessmentFactsAggregatedScoreResult_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] ADD CONSTRAINT [CourseStudentAssessmentFactsAggregatedScoreResult_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentAssessmentFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[CourseStudentAssessmentFactsStudentsEnrolled] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentAssessmentFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentAssessmentFactsStudentsEnrolled] ADD CONSTRAINT [CourseStudentAssessmentFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFacts] --
CREATE TABLE [tpdm].[CourseStudentFacts] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CourseStudentFacts_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFacts] ADD CONSTRAINT [CourseStudentFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[CourseStudentFacts] ADD CONSTRAINT [CourseStudentFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[CourseStudentFacts] ADD CONSTRAINT [CourseStudentFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedByDisability] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedByDisability] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [DisabilityDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TypeNumber] [INT] NULL,
    [Percentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedByDisability_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [DisabilityDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedByDisability] ADD CONSTRAINT [CourseStudentFactsAggregatedByDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [StudentsDisabledNumber] [INT] NULL,
    [StudentsDisabledPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled] ADD CONSTRAINT [CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedELLEnrollment] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedELLEnrollment] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [ELLEnrollmentNumber] [INT] NULL,
    [ELLEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedELLEnrollment_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedELLEnrollment] ADD CONSTRAINT [CourseStudentFactsAggregatedELLEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedESLEnrollment] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedESLEnrollment] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [ESLEnrollmentNumber] [INT] NULL,
    [ESLEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedESLEnrollment_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedESLEnrollment] ADD CONSTRAINT [CourseStudentFactsAggregatedESLEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedGender] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedGender] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [GenderDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [GenderTypeNumber] [INT] NULL,
    [GenderTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedGender_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [GenderDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedGender] ADD CONSTRAINT [CourseStudentFactsAggregatedGender_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [HispanicLatinoEthnicity] [BIT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [HispanicLatinoEthnicityNumber] [INT] NULL,
    [HispanicLatinoEthnicityPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedHispanicLatinoEthnicity_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [HispanicLatinoEthnicity] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] ADD CONSTRAINT [CourseStudentFactsAggregatedHispanicLatinoEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedLanguage] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedLanguage] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [LanguageTypeNumber] [INT] NULL,
    [LanguageTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedLanguage_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [LanguageDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedLanguage] ADD CONSTRAINT [CourseStudentFactsAggregatedLanguage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedRace] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedRace] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [RaceTypeNumber] [INT] NULL,
    [RaceTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedRace_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [RaceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedRace] ADD CONSTRAINT [CourseStudentFactsAggregatedRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolFoodServiceProgramServiceDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TypeNumber] [INT] NULL,
    [TypePercentage] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedSchoolFoodServiceProgramService_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolFoodServiceProgramServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] ADD CONSTRAINT [CourseStudentFactsAggregatedSchoolFoodServiceProgramService_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedSection504Enrollment] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedSection504Enrollment] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [Number504Enrolled] [INT] NULL,
    [Percentage504Enrolled] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedSection504Enrollment_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSection504Enrollment] ADD CONSTRAINT [CourseStudentFactsAggregatedSection504Enrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedSex] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedSex] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SexDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SexTypeNumber] [INT] NULL,
    [SexTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedSex_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SexDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSex] ADD CONSTRAINT [CourseStudentFactsAggregatedSex_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedSPED] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedSPED] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SPEDEnrollmentNumber] [INT] NULL,
    [SPEDEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedSPED_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSPED] ADD CONSTRAINT [CourseStudentFactsAggregatedSPED_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsAggregatedTitleIEnrollment] --
CREATE TABLE [tpdm].[CourseStudentFactsAggregatedTitleIEnrollment] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TitleIEnrollmentNumber] [INT] NULL,
    [TitleIEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsAggregatedTitleIEnrollment_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsAggregatedTitleIEnrollment] ADD CONSTRAINT [CourseStudentFactsAggregatedTitleIEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CourseStudentFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[CourseStudentFactsStudentsEnrolled] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseStudentFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CourseStudentFactsStudentsEnrolled] ADD CONSTRAINT [CourseStudentFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CredentialBoardCertification] --
CREATE TABLE [tpdm].[CredentialBoardCertification] (
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [BoardCertification] [BIT] NULL,
    [BoardCertificationDate] [DATE] NULL,
    [BoardCertificationTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CredentialBoardCertification_PK] PRIMARY KEY CLUSTERED (
        [CredentialIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CredentialBoardCertification] ADD CONSTRAINT [CredentialBoardCertification_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CredentialCertificationExam] --
CREATE TABLE [tpdm].[CredentialCertificationExam] (
    [CertificationExamTitle] [NVARCHAR](60) NOT NULL,
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [CertificationExamTypeDescriptorId] [INT] NULL,
    [CertificationExamStatusDescriptorId] [INT] NULL,
    [CertificationExamDate] [DATE] NOT NULL,
    [AttemptNumber] [INT] NULL,
    [CertificationExamOverallScore] [INT] NULL,
    [CertificationExamPassFail] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CredentialCertificationExam_PK] PRIMARY KEY CLUSTERED (
        [CertificationExamTitle] ASC,
        [CredentialIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CredentialCertificationExam] ADD CONSTRAINT [CredentialCertificationExam_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CredentialExtension] --
CREATE TABLE [tpdm].[CredentialExtension] (
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [CurrentCredential] [BIT] NULL,
    [RevocationDate] [DATE] NULL,
    [RevocationReason] [NVARCHAR](40) NULL,
    [SuspensionDate] [DATE] NULL,
    [SuspensionReason] [NVARCHAR](40) NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CredentialExtension_PK] PRIMARY KEY CLUSTERED (
        [CredentialIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CredentialExtension] ADD CONSTRAINT [CredentialExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CredentialRecommendation] --
CREATE TABLE [tpdm].[CredentialRecommendation] (
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [CredentialFieldDescriptorId] [INT] NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [TeachingCredentialDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CredentialRecommendation_PK] PRIMARY KEY CLUSTERED (
        [CredentialIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CredentialRecommendation] ADD CONSTRAINT [CredentialRecommendation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[CredentialRecommendingInstitution] --
CREATE TABLE [tpdm].[CredentialRecommendingInstitution] (
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [RecommendingInstutionName] [NVARCHAR](75) NOT NULL,
    [RecommendingDate] [DATE] NULL,
    [RecommendingInstitutionCountryDescriptorId] [INT] NULL,
    [RecommendingInstitutionStateAbbreviationDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CredentialRecommendingInstitution_PK] PRIMARY KEY CLUSTERED (
        [CredentialIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[CredentialRecommendingInstitution] ADD CONSTRAINT [CredentialRecommendingInstitution_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationCourseTranscriptFacts] --
CREATE TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [CourseTitle] [NVARCHAR](60) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EducationOrganizationCourseTranscriptFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] ADD CONSTRAINT [EducationOrganizationCourseTranscriptFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] ADD CONSTRAINT [EducationOrganizationCourseTranscriptFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] ADD CONSTRAINT [EducationOrganizationCourseTranscriptFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned] --
CREATE TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [FinalLetterGrade] [NVARCHAR](20) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [LetterGradeTypeNumber] [INT] NULL,
    [LetterGradeTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [FinalLetterGrade] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned] ADD CONSTRAINT [EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned] --
CREATE TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AverageFinalNumericGradeEarned] [DECIMAL](9, 2) NOT NULL,
    [NumericGradeNCount] [INT] NULL,
    [NumericGradeStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned] ADD CONSTRAINT [EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationCourseTranscriptFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsStudentsEnrolled] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationCourseTranscriptFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsStudentsEnrolled] ADD CONSTRAINT [EducationOrganizationCourseTranscriptFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationFacts] --
CREATE TABLE [tpdm].[EducationOrganizationFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [NumberAdministratorsEmployed] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [NumberTeachersEmployed] [INT] NULL,
    [PercentStudentsFreeReducedLunch] [DECIMAL](5, 4) NULL,
    [PercentStudentsLimitedEnglishProficiency] [DECIMAL](5, 4) NULL,
    [PercentStudentsSpecialEducation] [DECIMAL](5, 4) NULL,
    [HiringRate] [DECIMAL](5, 4) NULL,
    [RetentionRate] [DECIMAL](5, 4) NULL,
    [RetirementRate] [DECIMAL](5, 4) NULL,
    [AverageYearsInDistrictEmployed] [DECIMAL](5, 2) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EducationOrganizationFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationFacts] ADD CONSTRAINT [EducationOrganizationFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EducationOrganizationFacts] ADD CONSTRAINT [EducationOrganizationFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EducationOrganizationFacts] ADD CONSTRAINT [EducationOrganizationFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EducationOrganizationFactsAggregatedSalary] --
CREATE TABLE [tpdm].[EducationOrganizationFactsAggregatedSalary] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [AverageSalary] [MONEY] NOT NULL,
    [CountOfSalariesAveraged] [INT] NULL,
    [StandardDeviation] [INT] NULL,
    [SalaryMinRange] [INT] NULL,
    [SalaryMaxRange] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationFactsAggregatedSalary_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationFactsAggregatedSalary] ADD CONSTRAINT [EducationOrganizationFactsAggregatedSalary_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationFactsVacancies] --
CREATE TABLE [tpdm].[EducationOrganizationFactsVacancies] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberOfVacancies] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationFactsVacancies_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationFactsVacancies] ADD CONSTRAINT [EducationOrganizationFactsVacancies_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] --
CREATE TABLE [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationFactsVacanciesGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [GradeLevelDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] ADD CONSTRAINT [EducationOrganizationFactsVacanciesGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationNetworkExtension] --
CREATE TABLE [tpdm].[EducationOrganizationNetworkExtension] (
    [EducationOrganizationNetworkId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationNetworkExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationNetworkId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationNetworkExtension] ADD CONSTRAINT [EducationOrganizationNetworkExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAcademicRecordFacts] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AggregatedGPAMax] [DECIMAL](18, 4) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAcademicRecordFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ADD CONSTRAINT [EducationOrganizationStudentAcademicRecordFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ADD CONSTRAINT [EducationOrganizationStudentAcademicRecordFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ADD CONSTRAINT [EducationOrganizationStudentAcademicRecordFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [GradePointAverage] [DECIMAL](18, 4) NOT NULL,
    [GradePointNCount] [INT] NULL,
    [GradePointStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] ADD CONSTRAINT [EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [GradePointAverage] [DECIMAL](18, 4) NOT NULL,
    [GradePointNCount] [INT] NULL,
    [GradePointStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage] ADD CONSTRAINT [EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled] ADD CONSTRAINT [EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAssessmentFacts] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [AssessmentTitle] [NVARCHAR](100) NULL,
    [AssessmentCategoryDescriptorId] [INT] NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [AdministrationDate] [DATE] NULL,
    [TermDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAssessmentFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] ADD CONSTRAINT [EducationOrganizationStudentAssessmentFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] ADD CONSTRAINT [EducationOrganizationStudentAssessmentFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] ADD CONSTRAINT [EducationOrganizationStudentAssessmentFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [PerformanceLevelDescriptorId] [INT] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [PerformanceLevelMetNumber] [INT] NULL,
    [PerformanceLevelMetPercentage] [DECIMAL](5, 4) NULL,
    [PerformanceLevelTypeNumber] [INT] NULL,
    [PerformanceLevelTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [PerformanceLevelDescriptorId] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] ADD CONSTRAINT [EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [AssessmentReportingMethodDescriptorId] [INT] NOT NULL,
    [AverageScoreResultDatatypeTypeDescriptorId] [INT] NOT NULL,
    [AverageScoreResult] [NVARCHAR](35) NOT NULL,
    [ScoreNCount] [INT] NULL,
    [ScoreStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] ADD CONSTRAINT [EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentAssessmentFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsStudentsEnrolled] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentAssessmentFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsStudentsEnrolled] ADD CONSTRAINT [EducationOrganizationStudentAssessmentFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFacts] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFacts] ADD CONSTRAINT [EducationOrganizationStudentFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFacts] ADD CONSTRAINT [EducationOrganizationStudentFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFacts] ADD CONSTRAINT [EducationOrganizationStudentFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] (
    [DisabilityDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TypeNumber] [INT] NULL,
    [Percentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedByDisability_PK] PRIMARY KEY CLUSTERED (
        [DisabilityDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedByDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [StudentsDisabledNumber] [INT] NULL,
    [StudentsDisabledPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedELLEnrollment] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedELLEnrollment] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [ELLEnrollmentNumber] [INT] NULL,
    [ELLEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedELLEnrollment_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedELLEnrollment] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedELLEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedESLEnrollment] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedESLEnrollment] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [ESLEnrollmentNumber] [INT] NULL,
    [ESLEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedESLEnrollment_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedESLEnrollment] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedESLEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedGender] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedGender] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [GenderDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [GenderTypeNumber] [INT] NULL,
    [GenderTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedGender_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [GenderDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedGender] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedGender_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [HispanicLatinoEthnicity] [BIT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [HispanicLatinoEthnicityNumber] [INT] NULL,
    [HispanicLatinoEthnicityPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [HispanicLatinoEthnicity] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [LanguageTypeNumber] [INT] NULL,
    [LanguageTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedLanguage_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [LanguageDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedLanguage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedRace] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedRace] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [RaceTypeNumber] [INT] NULL,
    [RaceTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedRace_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [RaceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedRace] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolFoodServiceProgramServiceDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TypeNumber] [INT] NULL,
    [TypePercentage] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolFoodServiceProgramServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedSection504Enrollment] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSection504Enrollment] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [Number504Enrolled] [INT] NULL,
    [Percentage504Enrolled] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedSection504Enrollment_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSection504Enrollment] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedSection504Enrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedSex] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSex] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SexDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SexTypeNumber] [INT] NULL,
    [SexTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedSex_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SexDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSex] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedSex_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedSPED] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSPED] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SPEDEnrollmentNumber] [INT] NULL,
    [SPEDEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedSPED_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSPED] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedSPED_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsAggregatedTitleIEnrollment] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedTitleIEnrollment] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TitleIEnrollmentNumber] [INT] NULL,
    [TitleIEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsAggregatedTitleIEnrollment_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedTitleIEnrollment] ADD CONSTRAINT [EducationOrganizationStudentFactsAggregatedTitleIEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationOrganizationStudentFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[EducationOrganizationStudentFactsStudentsEnrolled] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationOrganizationStudentFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationOrganizationStudentFactsStudentsEnrolled] ADD CONSTRAINT [EducationOrganizationStudentFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EducationServiceCenterExtension] --
CREATE TABLE [tpdm].[EducationServiceCenterExtension] (
    [EducationServiceCenterId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [EducationServiceCenterExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationServiceCenterId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EducationServiceCenterExtension] ADD CONSTRAINT [EducationServiceCenterExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[EmploymentEvent] --
CREATE TABLE [tpdm].[EmploymentEvent] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EmploymentEventTypeDescriptorId] [INT] NOT NULL,
    [RequisitionNumber] [NVARCHAR](20) NOT NULL,
    [HireDate] [DATE] NULL,
    [EarlyHire] [BIT] NULL,
    [InternalExternalHireDescriptorId] [INT] NULL,
    [MutualConsent] [BIT] NULL,
    [RestrictedChoice] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EmploymentEvent_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EmploymentEventTypeDescriptorId] ASC,
        [RequisitionNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EmploymentEvent] ADD CONSTRAINT [EmploymentEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EmploymentEvent] ADD CONSTRAINT [EmploymentEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EmploymentEvent] ADD CONSTRAINT [EmploymentEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EmploymentEventTypeDescriptor] --
CREATE TABLE [tpdm].[EmploymentEventTypeDescriptor] (
    [EmploymentEventTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EmploymentEventTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EmploymentEventTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[EmploymentSeparationEvent] --
CREATE TABLE [tpdm].[EmploymentSeparationEvent] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EmploymentSeparationDate] [DATE] NOT NULL,
    [RequisitionNumber] [NVARCHAR](20) NOT NULL,
    [EmploymentSeparationTypeDescriptorId] [INT] NOT NULL,
    [EmploymentSeparationEnteredDate] [DATE] NULL,
    [EmploymentSeparationReasonDescriptorId] [INT] NULL,
    [RemainingInDistrict] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [EmploymentSeparationEvent_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EmploymentSeparationDate] ASC,
        [RequisitionNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[EmploymentSeparationEvent] ADD CONSTRAINT [EmploymentSeparationEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[EmploymentSeparationEvent] ADD CONSTRAINT [EmploymentSeparationEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[EmploymentSeparationEvent] ADD CONSTRAINT [EmploymentSeparationEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[EmploymentSeparationReasonDescriptor] --
CREATE TABLE [tpdm].[EmploymentSeparationReasonDescriptor] (
    [EmploymentSeparationReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EmploymentSeparationReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EmploymentSeparationReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[EmploymentSeparationTypeDescriptor] --
CREATE TABLE [tpdm].[EmploymentSeparationTypeDescriptor] (
    [EmploymentSeparationTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EmploymentSeparationTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EmploymentSeparationTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[EnglishLanguageExamDescriptor] --
CREATE TABLE [tpdm].[EnglishLanguageExamDescriptor] (
    [EnglishLanguageExamDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EnglishLanguageExamDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EnglishLanguageExamDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[FederalLocaleCodeDescriptor] --
CREATE TABLE [tpdm].[FederalLocaleCodeDescriptor] (
    [FederalLocaleCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FederalLocaleCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FederalLocaleCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[FieldworkTypeDescriptor] --
CREATE TABLE [tpdm].[FieldworkTypeDescriptor] (
    [FieldworkTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FieldworkTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FieldworkTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[FundingSourceDescriptor] --
CREATE TABLE [tpdm].[FundingSourceDescriptor] (
    [FundingSourceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FundingSourceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FundingSourceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[GenderDescriptor] --
CREATE TABLE [tpdm].[GenderDescriptor] (
    [GenderDescriptorId] [INT] NOT NULL,
    CONSTRAINT [GenderDescriptor_PK] PRIMARY KEY CLUSTERED (
        [GenderDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[GradebookEntryExtension] --
CREATE TABLE [tpdm].[GradebookEntryExtension] (
    [DateAssigned] [DATE] NOT NULL,
    [GradebookEntryTitle] [NVARCHAR](60) NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ProgramGatewayDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [GradebookEntryExtension_PK] PRIMARY KEY CLUSTERED (
        [DateAssigned] ASC,
        [GradebookEntryTitle] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[GradebookEntryExtension] ADD CONSTRAINT [GradebookEntryExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[HireStatusDescriptor] --
CREATE TABLE [tpdm].[HireStatusDescriptor] (
    [HireStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [HireStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [HireStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[HiringSourceDescriptor] --
CREATE TABLE [tpdm].[HiringSourceDescriptor] (
    [HiringSourceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [HiringSourceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [HiringSourceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[InternalExternalHireDescriptor] --
CREATE TABLE [tpdm].[InternalExternalHireDescriptor] (
    [InternalExternalHireDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InternalExternalHireDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InternalExternalHireDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[LevelOfDegreeAwardedDescriptor] --
CREATE TABLE [tpdm].[LevelOfDegreeAwardedDescriptor] (
    [LevelOfDegreeAwardedDescriptorId] [INT] NOT NULL,
    CONSTRAINT [LevelOfDegreeAwardedDescriptor_PK] PRIMARY KEY CLUSTERED (
        [LevelOfDegreeAwardedDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[LevelTypeDescriptor] --
CREATE TABLE [tpdm].[LevelTypeDescriptor] (
    [LevelTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [LevelTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [LevelTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[LocalEducationAgencyExtension] --
CREATE TABLE [tpdm].[LocalEducationAgencyExtension] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [LocalEducationAgencyExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[LocalEducationAgencyExtension] ADD CONSTRAINT [LocalEducationAgencyExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[OpenStaffPositionEvent] --
CREATE TABLE [tpdm].[OpenStaffPositionEvent] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [OpenStaffPositionEventTypeDescriptorId] [INT] NOT NULL,
    [RequisitionNumber] [NVARCHAR](20) NOT NULL,
    [OpenStaffPositionEventStatusDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [OpenStaffPositionEvent_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EventDate] ASC,
        [OpenStaffPositionEventTypeDescriptorId] ASC,
        [RequisitionNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[OpenStaffPositionEvent] ADD CONSTRAINT [OpenStaffPositionEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[OpenStaffPositionEvent] ADD CONSTRAINT [OpenStaffPositionEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[OpenStaffPositionEvent] ADD CONSTRAINT [OpenStaffPositionEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[OpenStaffPositionEventStatusDescriptor] --
CREATE TABLE [tpdm].[OpenStaffPositionEventStatusDescriptor] (
    [OpenStaffPositionEventStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [OpenStaffPositionEventStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [OpenStaffPositionEventStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[OpenStaffPositionEventTypeDescriptor] --
CREATE TABLE [tpdm].[OpenStaffPositionEventTypeDescriptor] (
    [OpenStaffPositionEventTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [OpenStaffPositionEventTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [OpenStaffPositionEventTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[OpenStaffPositionExtension] --
CREATE TABLE [tpdm].[OpenStaffPositionExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RequisitionNumber] [NVARCHAR](20) NOT NULL,
    [SchoolYear] [SMALLINT] NULL,
    [FullTimeEquivalency] [DECIMAL](3, 2) NULL,
    [OpenStaffPositionReasonDescriptorId] [INT] NULL,
    [IsActive] [BIT] NULL,
    [MaxSalary] [DECIMAL](9, 2) NULL,
    [MinSalary] [DECIMAL](9, 2) NULL,
    [FundingSourceDescriptorId] [INT] NULL,
    [HighNeedAcademicSubject] [BIT] NULL,
    [PositionControlNumber] [NVARCHAR](20) NULL,
    [TermDescriptorId] [INT] NULL,
    [TotalBudgeted] [DECIMAL](9, 2) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [OpenStaffPositionExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RequisitionNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[OpenStaffPositionExtension] ADD CONSTRAINT [OpenStaffPositionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[OpenStaffPositionReasonDescriptor] --
CREATE TABLE [tpdm].[OpenStaffPositionReasonDescriptor] (
    [OpenStaffPositionReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [OpenStaffPositionReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [OpenStaffPositionReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[PerformanceMeasure] --
CREATE TABLE [tpdm].[PerformanceMeasure] (
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [PerformanceMeasureTypeDescriptorId] [INT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [ScheduleDateOfPerformanceMeasure] [DATE] NULL,
    [ActualDateOfPerformanceMeasure] [DATE] NOT NULL,
    [TimeOfPerformanceMeasure] [TIME](7) NULL,
    [DurationOfPerformanceMeasure] [INT] NULL,
    [Announced] [BIT] NULL,
    [CoteachingStyleObservedDescriptorId] [INT] NULL,
    [Comments] [NVARCHAR](1024) NULL,
    [PerformanceMeasureInstanceDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PerformanceMeasure_PK] PRIMARY KEY CLUSTERED (
        [PerformanceMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasure] ADD CONSTRAINT [PerformanceMeasure_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[PerformanceMeasure] ADD CONSTRAINT [PerformanceMeasure_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[PerformanceMeasure] ADD CONSTRAINT [PerformanceMeasure_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[PerformanceMeasureCourseAssociation] --
CREATE TABLE [tpdm].[PerformanceMeasureCourseAssociation] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PerformanceMeasureCourseAssociation_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [PerformanceMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] ADD CONSTRAINT [PerformanceMeasureCourseAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] ADD CONSTRAINT [PerformanceMeasureCourseAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] ADD CONSTRAINT [PerformanceMeasureCourseAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[PerformanceMeasureFacts] --
CREATE TABLE [tpdm].[PerformanceMeasureFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [PerformanceMeasureTypeDescriptorId] [INT] NOT NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PerformanceMeasureFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureFacts] ADD CONSTRAINT [PerformanceMeasureFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[PerformanceMeasureFacts] ADD CONSTRAINT [PerformanceMeasureFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[PerformanceMeasureFacts] ADD CONSTRAINT [PerformanceMeasureFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[PerformanceMeasureFactsGradeLevel] --
CREATE TABLE [tpdm].[PerformanceMeasureFactsGradeLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasureFactsGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [GradeLevelDescriptorId] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureFactsGradeLevel] ADD CONSTRAINT [PerformanceMeasureFactsGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureGradeLevel] --
CREATE TABLE [tpdm].[PerformanceMeasureGradeLevel] (
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasureGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [GradeLevelDescriptorId] ASC,
        [PerformanceMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureGradeLevel] ADD CONSTRAINT [PerformanceMeasureGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureInstanceDescriptor] --
CREATE TABLE [tpdm].[PerformanceMeasureInstanceDescriptor] (
    [PerformanceMeasureInstanceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PerformanceMeasureInstanceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PerformanceMeasureInstanceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[PerformanceMeasurePersonBeingReviewed] --
CREATE TABLE [tpdm].[PerformanceMeasurePersonBeingReviewed] (
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [FirstName] [NVARCHAR](75) NOT NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NULL,
    [EducationOrganizationId] [INT] NULL,
    [StaffUSI] [INT] NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasurePersonBeingReviewed_PK] PRIMARY KEY CLUSTERED (
        [PerformanceMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasurePersonBeingReviewed] ADD CONSTRAINT [PerformanceMeasurePersonBeingReviewed_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureProgramGateway] --
CREATE TABLE [tpdm].[PerformanceMeasureProgramGateway] (
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [ProgramGatewayDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasureProgramGateway_PK] PRIMARY KEY CLUSTERED (
        [PerformanceMeasureIdentifier] ASC,
        [ProgramGatewayDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureProgramGateway] ADD CONSTRAINT [PerformanceMeasureProgramGateway_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureReviewer] --
CREATE TABLE [tpdm].[PerformanceMeasureReviewer] (
    [FirstName] [NVARCHAR](75) NOT NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasureReviewer_PK] PRIMARY KEY CLUSTERED (
        [FirstName] ASC,
        [LastSurname] ASC,
        [PerformanceMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureReviewer] ADD CONSTRAINT [PerformanceMeasureReviewer_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureReviewerReceivedTraining] --
CREATE TABLE [tpdm].[PerformanceMeasureReviewerReceivedTraining] (
    [FirstName] [NVARCHAR](75) NOT NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [ReceivedTrainingDate] [DATE] NULL,
    [InterRaterReliabilityScore] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasureReviewerReceivedTraining_PK] PRIMARY KEY CLUSTERED (
        [FirstName] ASC,
        [LastSurname] ASC,
        [PerformanceMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureReviewerReceivedTraining] ADD CONSTRAINT [PerformanceMeasureReviewerReceivedTraining_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureRubric] --
CREATE TABLE [tpdm].[PerformanceMeasureRubric] (
    [EducationOrganizationId] [INT] NOT NULL,
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PerformanceMeasureRubric_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [PerformanceMeasureIdentifier] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PerformanceMeasureRubric] ADD CONSTRAINT [PerformanceMeasureRubric_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PerformanceMeasureTypeDescriptor] --
CREATE TABLE [tpdm].[PerformanceMeasureTypeDescriptor] (
    [PerformanceMeasureTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PerformanceMeasureTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PerformanceMeasureTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[PostSecondaryInstitutionExtension] --
CREATE TABLE [tpdm].[PostSecondaryInstitutionExtension] (
    [PostSecondaryInstitutionId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [PostSecondaryInstitutionExtension_PK] PRIMARY KEY CLUSTERED (
        [PostSecondaryInstitutionId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[PostSecondaryInstitutionExtension] ADD CONSTRAINT [PostSecondaryInstitutionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[PreviousCareerDescriptor] --
CREATE TABLE [tpdm].[PreviousCareerDescriptor] (
    [PreviousCareerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PreviousCareerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PreviousCareerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ProfessionalDevelopmentEvent] --
CREATE TABLE [tpdm].[ProfessionalDevelopmentEvent] (
    [ProfessionalDevelopmentTitle] [NVARCHAR](60) NOT NULL,
    [ProfessionalDevelopmentOfferedByDescriptorId] [INT] NOT NULL,
    [TotalHours] [INT] NULL,
    [Required] [BIT] NULL,
    [MultipleSession] [BIT] NULL,
    [ProfessionalDevelopmentReason] [NVARCHAR](60) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ProfessionalDevelopmentEvent_PK] PRIMARY KEY CLUSTERED (
        [ProfessionalDevelopmentTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ADD CONSTRAINT [ProfessionalDevelopmentEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ADD CONSTRAINT [ProfessionalDevelopmentEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ADD CONSTRAINT [ProfessionalDevelopmentEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] --
CREATE TABLE [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] (
    [ProfessionalDevelopmentOfferedByDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProfessionalDevelopmentOfferedByDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProfessionalDevelopmentOfferedByDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ProgramGatewayDescriptor] --
CREATE TABLE [tpdm].[ProgramGatewayDescriptor] (
    [ProgramGatewayDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProgramGatewayDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProgramGatewayDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[Prospect] --
CREATE TABLE [tpdm].[Prospect] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [PersonalTitlePrefix] [NVARCHAR](30) NULL,
    [FirstName] [NVARCHAR](75) NOT NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [MaidenName] [NVARCHAR](75) NULL,
    [ElectronicMailAddress] [NVARCHAR](128) NOT NULL,
    [Applied] [BIT] NULL,
    [HispanicLatinoEthnicity] [BIT] NULL,
    [Met] [BIT] NULL,
    [Notes] [NVARCHAR](255) NULL,
    [PreScreeningRating] [INT] NULL,
    [Referral] [BIT] NULL,
    [ReferredBy] [NVARCHAR](50) NULL,
    [SexDescriptorId] [INT] NULL,
    [SocialMediaUserName] [NVARCHAR](50) NULL,
    [SocialMediaNetworkName] [NVARCHAR](50) NULL,
    [GenderDescriptorId] [INT] NULL,
    [EconomicDisadvantaged] [BIT] NULL,
    [FirstGenerationStudent] [BIT] NULL,
    [ProspectTypeDescriptorId] [INT] NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Prospect_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[Prospect] ADD CONSTRAINT [Prospect_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[Prospect] ADD CONSTRAINT [Prospect_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[Prospect] ADD CONSTRAINT [Prospect_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ProspectAid] --
CREATE TABLE [tpdm].[ProspectAid] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [AidConditionDescription] [NVARCHAR](1024) NULL,
    [AidTypeDescriptorId] [INT] NOT NULL,
    [AidAmount] [MONEY] NULL,
    [PellGrantRecipient] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectAid_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectAid] ADD CONSTRAINT [ProspectAid_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectCredential] --
CREATE TABLE [tpdm].[ProspectCredential] (
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectCredential_PK] PRIMARY KEY CLUSTERED (
        [CredentialIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectCredential] ADD CONSTRAINT [ProspectCredential_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectCurrentPosition] --
CREATE TABLE [tpdm].[ProspectCurrentPosition] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [NameOfInstitution] [NVARCHAR](75) NOT NULL,
    [Location] [NVARCHAR](75) NOT NULL,
    [PositionTitle] [NVARCHAR](100) NOT NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectCurrentPosition_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectCurrentPosition] ADD CONSTRAINT [ProspectCurrentPosition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectCurrentPositionGradeLevel] --
CREATE TABLE [tpdm].[ProspectCurrentPositionGradeLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectCurrentPositionGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GradeLevelDescriptorId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectCurrentPositionGradeLevel] ADD CONSTRAINT [ProspectCurrentPositionGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectDisability] --
CREATE TABLE [tpdm].[ProspectDisability] (
    [DisabilityDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [DisabilityDiagnosis] [NVARCHAR](80) NULL,
    [OrderOfDisability] [INT] NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectDisability_PK] PRIMARY KEY CLUSTERED (
        [DisabilityDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectDisability] ADD CONSTRAINT [ProspectDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectDisabilityDesignation] --
CREATE TABLE [tpdm].[ProspectDisabilityDesignation] (
    [DisabilityDescriptorId] [INT] NOT NULL,
    [DisabilityDesignationDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectDisabilityDesignation_PK] PRIMARY KEY CLUSTERED (
        [DisabilityDescriptorId] ASC,
        [DisabilityDesignationDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectDisabilityDesignation] ADD CONSTRAINT [ProspectDisabilityDesignation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectPersonalIdentificationDocument] --
CREATE TABLE [tpdm].[ProspectPersonalIdentificationDocument] (
    [EducationOrganizationId] [INT] NOT NULL,
    [IdentificationDocumentUseDescriptorId] [INT] NOT NULL,
    [PersonalInformationVerificationDescriptorId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [DocumentTitle] [NVARCHAR](60) NULL,
    [DocumentExpirationDate] [DATE] NULL,
    [IssuerDocumentIdentificationCode] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerCountryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectPersonalIdentificationDocument_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [IdentificationDocumentUseDescriptorId] ASC,
        [PersonalInformationVerificationDescriptorId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectPersonalIdentificationDocument] ADD CONSTRAINT [ProspectPersonalIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectProfessionalDevelopmentEventAttendance] --
CREATE TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] (
    [AttendanceDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProfessionalDevelopmentTitle] [NVARCHAR](60) NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [AttendanceEventReason] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ProspectProfessionalDevelopmentEventAttendance_PK] PRIMARY KEY CLUSTERED (
        [AttendanceDate] ASC,
        [EducationOrganizationId] ASC,
        [ProfessionalDevelopmentTitle] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [ProspectProfessionalDevelopmentEventAttendance_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [ProspectProfessionalDevelopmentEventAttendance_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [ProspectProfessionalDevelopmentEventAttendance_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[ProspectQualifications] --
CREATE TABLE [tpdm].[ProspectQualifications] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [Eligible] [BIT] NOT NULL,
    [CapacityToServe] [BIT] NULL,
    [YearsOfServiceCurrentPlacement] [DECIMAL](5, 2) NULL,
    [YearsOfServiceTotal] [DECIMAL](5, 2) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectQualifications_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectQualifications] ADD CONSTRAINT [ProspectQualifications_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectRace] --
CREATE TABLE [tpdm].[ProspectRace] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectRace_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC,
        [RaceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectRace] ADD CONSTRAINT [ProspectRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectRecruitmentEvent] --
CREATE TABLE [tpdm].[ProspectRecruitmentEvent] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [EventTitle] [NVARCHAR](50) NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectRecruitmentEvent_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EventDate] ASC,
        [EventTitle] ASC,
        [ProspectIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectRecruitmentEvent] ADD CONSTRAINT [ProspectRecruitmentEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectTelephone] --
CREATE TABLE [tpdm].[ProspectTelephone] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [TelephoneNumber] [NVARCHAR](24) NOT NULL,
    [TelephoneNumberTypeDescriptorId] [INT] NOT NULL,
    [OrderOfPriority] [INT] NULL,
    [TextMessageCapabilityIndicator] [BIT] NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectTelephone_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC,
        [TelephoneNumber] ASC,
        [TelephoneNumberTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectTelephone] ADD CONSTRAINT [ProspectTelephone_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectTouchpoint] --
CREATE TABLE [tpdm].[ProspectTouchpoint] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [TouchpointContent] [NVARCHAR](255) NOT NULL,
    [TouchpointDate] [DATE] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProspectTouchpoint_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC,
        [TouchpointContent] ASC,
        [TouchpointDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[ProspectTouchpoint] ADD CONSTRAINT [ProspectTouchpoint_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ProspectTypeDescriptor] --
CREATE TABLE [tpdm].[ProspectTypeDescriptor] (
    [ProspectTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProspectTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProspectTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[RecruitmentEvent] --
CREATE TABLE [tpdm].[RecruitmentEvent] (
    [EventDate] [DATE] NOT NULL,
    [EventTitle] [NVARCHAR](50) NOT NULL,
    [EventDescription] [NVARCHAR](255) NULL,
    [RecruitmentEventTypeDescriptorId] [INT] NOT NULL,
    [EventLocation] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [RecruitmentEvent_PK] PRIMARY KEY CLUSTERED (
        [EventDate] ASC,
        [EventTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RecruitmentEvent] ADD CONSTRAINT [RecruitmentEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[RecruitmentEvent] ADD CONSTRAINT [RecruitmentEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[RecruitmentEvent] ADD CONSTRAINT [RecruitmentEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[RecruitmentEventTypeDescriptor] --
CREATE TABLE [tpdm].[RecruitmentEventTypeDescriptor] (
    [RecruitmentEventTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [RecruitmentEventTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [RecruitmentEventTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[Rubric] --
CREATE TABLE [tpdm].[Rubric] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [RubricDescription] [NVARCHAR](255) NULL,
    [InterRaterReliabilityScore] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Rubric_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[Rubric] ADD CONSTRAINT [Rubric_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[Rubric] ADD CONSTRAINT [Rubric_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[Rubric] ADD CONSTRAINT [Rubric_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[RubricLevel] --
CREATE TABLE [tpdm].[RubricLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RubricLevelCode] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [RubricLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RubricLevelCode] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RubricLevel] ADD CONSTRAINT [RubricLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[RubricLevel] ADD CONSTRAINT [RubricLevel_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[RubricLevel] ADD CONSTRAINT [RubricLevel_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[RubricLevelInformation] --
CREATE TABLE [tpdm].[RubricLevelInformation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RubricLevelCode] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [LevelTypeDescriptorId] [INT] NOT NULL,
    [LevelTitle] [NVARCHAR](255) NOT NULL,
    [LevelDescription] [NVARCHAR](255) NULL,
    [MinimumScore] [NVARCHAR](35) NULL,
    [MaximumScore] [NVARCHAR](35) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [RubricLevelInformation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RubricLevelCode] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RubricLevelInformation] ADD CONSTRAINT [RubricLevelInformation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[RubricLevelResponse] --
CREATE TABLE [tpdm].[RubricLevelResponse] (
    [EducationOrganizationId] [INT] NOT NULL,
    [PerformanceMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [RubricLevelCode] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [NumericResponse] [INT] NOT NULL,
    [TextResponse] [NVARCHAR](2048) NULL,
    [AreaOfRefinement] [BIT] NULL,
    [AreaOfReinforcement] [BIT] NULL,
    [Comments] [NVARCHAR](1024) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [RubricLevelResponse_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [PerformanceMeasureIdentifier] ASC,
        [RubricLevelCode] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RubricLevelResponse] ADD CONSTRAINT [RubricLevelResponse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[RubricLevelResponse] ADD CONSTRAINT [RubricLevelResponse_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[RubricLevelResponse] ADD CONSTRAINT [RubricLevelResponse_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[RubricLevelResponseFacts] --
CREATE TABLE [tpdm].[RubricLevelResponseFacts] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [RubricLevelCode] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [RubricLevelResponseFacts_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [RubricLevelCode] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RubricLevelResponseFacts] ADD CONSTRAINT [RubricLevelResponseFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[RubricLevelResponseFacts] ADD CONSTRAINT [RubricLevelResponseFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[RubricLevelResponseFacts] ADD CONSTRAINT [RubricLevelResponseFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[RubricLevelResponseFactsAggregatedNumericResponse] --
CREATE TABLE [tpdm].[RubricLevelResponseFactsAggregatedNumericResponse] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [RubricLevelCode] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [AverageNumericResponse] [DECIMAL](18, 4) NOT NULL,
    [NumericResponseNCount] [INT] NULL,
    [NumericResponseStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [RubricLevelResponseFactsAggregatedNumericResponse_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactsAsOfDate] ASC,
        [RubricLevelCode] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RubricLevelResponseFactsAggregatedNumericResponse] ADD CONSTRAINT [RubricLevelResponseFactsAggregatedNumericResponse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[RubricLevelTheme] --
CREATE TABLE [tpdm].[RubricLevelTheme] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RubricLevelCode] [NVARCHAR](64) NOT NULL,
    [RubricTitle] [NVARCHAR](255) NOT NULL,
    [RubricTypeDescriptorId] [INT] NOT NULL,
    [ThemeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [RubricLevelTheme_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RubricLevelCode] ASC,
        [RubricTitle] ASC,
        [RubricTypeDescriptorId] ASC,
        [ThemeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[RubricLevelTheme] ADD CONSTRAINT [RubricLevelTheme_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[RubricTypeDescriptor] --
CREATE TABLE [tpdm].[RubricTypeDescriptor] (
    [RubricTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [RubricTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [RubricTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[SalaryTypeDescriptor] --
CREATE TABLE [tpdm].[SalaryTypeDescriptor] (
    [SalaryTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SalaryTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SalaryTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[SchoolExtension] --
CREATE TABLE [tpdm].[SchoolExtension] (
    [SchoolId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [SchoolStatusDescriptorId] [INT] NULL,
    [ImprovingSchool] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SchoolExtension] ADD CONSTRAINT [SchoolExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SchoolStatusDescriptor] --
CREATE TABLE [tpdm].[SchoolStatusDescriptor] (
    [SchoolStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SchoolStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SchoolStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[SectionCourseTranscriptFacts] --
CREATE TABLE [tpdm].[SectionCourseTranscriptFacts] (
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [CourseTitle] [NVARCHAR](60) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SectionCourseTranscriptFacts_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionCourseTranscriptFacts] ADD CONSTRAINT [SectionCourseTranscriptFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[SectionCourseTranscriptFacts] ADD CONSTRAINT [SectionCourseTranscriptFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[SectionCourseTranscriptFacts] ADD CONSTRAINT [SectionCourseTranscriptFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned] --
CREATE TABLE [tpdm].[SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned] (
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [FinalLetterGrade] [NVARCHAR](20) NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [LetterGradeTypeNumber] [INT] NULL,
    [LetterGradeTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [FinalLetterGrade] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned] ADD CONSTRAINT [SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionCourseTranscriptFactsAggregatedNumericGradeEarned] --
CREATE TABLE [tpdm].[SectionCourseTranscriptFactsAggregatedNumericGradeEarned] (
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [AverageFinalNumericGradeEarned] [DECIMAL](9, 2) NOT NULL,
    [NumericGradeNCount] [INT] NULL,
    [NumericGradeStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionCourseTranscriptFactsAggregatedNumericGradeEarned_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionCourseTranscriptFactsAggregatedNumericGradeEarned] ADD CONSTRAINT [SectionCourseTranscriptFactsAggregatedNumericGradeEarned_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionCourseTranscriptFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[SectionCourseTranscriptFactsStudentsEnrolled] (
    [FactAsOfDate] [DATE] NOT NULL,
    [FactsAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionCourseTranscriptFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [FactsAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionCourseTranscriptFactsStudentsEnrolled] ADD CONSTRAINT [SectionCourseTranscriptFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentAcademicRecordFacts] --
CREATE TABLE [tpdm].[SectionStudentAcademicRecordFacts] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [AggregatedGPAMax] [DECIMAL](18, 4) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SectionStudentAcademicRecordFacts_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAcademicRecordFacts] ADD CONSTRAINT [SectionStudentAcademicRecordFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[SectionStudentAcademicRecordFacts] ADD CONSTRAINT [SectionStudentAcademicRecordFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[SectionStudentAcademicRecordFacts] ADD CONSTRAINT [SectionStudentAcademicRecordFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] --
CREATE TABLE [tpdm].[SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [GradePointAverage] [DECIMAL](18, 4) NOT NULL,
    [GradePointNCount] [INT] NULL,
    [GradePointStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] ADD CONSTRAINT [SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage] --
CREATE TABLE [tpdm].[SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [GradePointAverage] [DECIMAL](18, 4) NOT NULL,
    [GradePointNCount] [INT] NULL,
    [GradePointStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage] ADD CONSTRAINT [SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentAcademicRecordFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[SectionStudentAcademicRecordFactsStudentsEnrolled] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentAcademicRecordFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsStudentsEnrolled] ADD CONSTRAINT [SectionStudentAcademicRecordFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentAssessmentFacts] --
CREATE TABLE [tpdm].[SectionStudentAssessmentFacts] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [AssessmentTitle] [NVARCHAR](100) NULL,
    [AssessmentCategoryDescriptorId] [INT] NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [AdministrationDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SectionStudentAssessmentFacts_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] ADD CONSTRAINT [SectionStudentAssessmentFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] ADD CONSTRAINT [SectionStudentAssessmentFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] ADD CONSTRAINT [SectionStudentAssessmentFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] --
CREATE TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [PerformanceLevelDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [PerformanceLevelMetNumber] [INT] NULL,
    [PerformanceLevelMetPercentage] [DECIMAL](5, 4) NULL,
    [PerformanceLevelTypeNumber] [INT] NULL,
    [PerformanceLevelTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentAssessmentFactsAggregatedPerformanceLevel_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [PerformanceLevelDescriptorId] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] ADD CONSTRAINT [SectionStudentAssessmentFactsAggregatedPerformanceLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] --
CREATE TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [AssessmentReportingMethodDescriptorId] [INT] NOT NULL,
    [AverageScoreResultDatatypeTypeDescriptorId] [INT] NOT NULL,
    [AverageScoreResult] [NVARCHAR](35) NOT NULL,
    [ScoreNCount] [INT] NULL,
    [ScoreStandardDeviation] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentAssessmentFactsAggregatedScoreResult_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] ADD CONSTRAINT [SectionStudentAssessmentFactsAggregatedScoreResult_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentAssessmentFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[SectionStudentAssessmentFactsStudentsEnrolled] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TakenSchoolYear] [SMALLINT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentAssessmentFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TakenSchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentAssessmentFactsStudentsEnrolled] ADD CONSTRAINT [SectionStudentAssessmentFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFacts] --
CREATE TABLE [tpdm].[SectionStudentFacts] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SectionStudentFacts_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFacts] ADD CONSTRAINT [SectionStudentFacts_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[SectionStudentFacts] ADD CONSTRAINT [SectionStudentFacts_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[SectionStudentFacts] ADD CONSTRAINT [SectionStudentFacts_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedByDisability] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedByDisability] (
    [DisabilityDescriptorId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TypeNumber] [INT] NULL,
    [Percentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedByDisability_PK] PRIMARY KEY CLUSTERED (
        [DisabilityDescriptorId] ASC,
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedByDisability] ADD CONSTRAINT [SectionStudentFactsAggregatedByDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [StudentsDisabledNumber] [INT] NULL,
    [StudentsDisabledPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled] ADD CONSTRAINT [SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedELLEnrollment] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedELLEnrollment] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [ELLEnrollmentNumber] [INT] NULL,
    [ELLEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedELLEnrollment_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedELLEnrollment] ADD CONSTRAINT [SectionStudentFactsAggregatedELLEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedESLEnrollment] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedESLEnrollment] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [ESLEnrollmentNumber] [INT] NULL,
    [ESLEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedESLEnrollment_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedESLEnrollment] ADD CONSTRAINT [SectionStudentFactsAggregatedESLEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedGender] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedGender] (
    [FactAsOfDate] [DATE] NOT NULL,
    [GenderDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [GenderTypeNumber] [INT] NULL,
    [GenderTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedGender_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [GenderDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedGender] ADD CONSTRAINT [SectionStudentFactsAggregatedGender_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] (
    [FactAsOfDate] [DATE] NOT NULL,
    [HispanicLatinoEthnicity] [BIT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [HispanicLatinoEthnicityNumber] [INT] NULL,
    [HispanicLatinoEthnicityPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedHispanicLatinoEthnicity_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [HispanicLatinoEthnicity] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] ADD CONSTRAINT [SectionStudentFactsAggregatedHispanicLatinoEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedLanguage] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedLanguage] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [LanguageTypeNumber] [INT] NULL,
    [LanguageTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedLanguage_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LanguageDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedLanguage] ADD CONSTRAINT [SectionStudentFactsAggregatedLanguage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedRace] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedRace] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [RaceTypeNumber] [INT] NULL,
    [RaceTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedRace_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [RaceDescriptorId] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedRace] ADD CONSTRAINT [SectionStudentFactsAggregatedRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolFoodServiceProgramServiceDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TypeNumber] [INT] NULL,
    [TypePercentage] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedSchoolFoodServiceProgramService_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolFoodServiceProgramServiceDescriptorId] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] ADD CONSTRAINT [SectionStudentFactsAggregatedSchoolFoodServiceProgramService_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedSection504Enrollment] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedSection504Enrollment] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [Number504Enrolled] [INT] NULL,
    [Percentage504Enrolled] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedSection504Enrollment_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSection504Enrollment] ADD CONSTRAINT [SectionStudentFactsAggregatedSection504Enrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedSex] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedSex] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [SexDescriptorId] [INT] NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SexTypeNumber] [INT] NULL,
    [SexTypePercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedSex_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [SexDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSex] ADD CONSTRAINT [SectionStudentFactsAggregatedSex_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedSPED] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedSPED] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [SPEDEnrollmentNumber] [INT] NULL,
    [SPEDEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedSPED_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSPED] ADD CONSTRAINT [SectionStudentFactsAggregatedSPED_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsAggregatedTitleIEnrollment] --
CREATE TABLE [tpdm].[SectionStudentFactsAggregatedTitleIEnrollment] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [TitleIEnrollmentNumber] [INT] NULL,
    [TitleIEnrollmentPercentage] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsAggregatedTitleIEnrollment_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsAggregatedTitleIEnrollment] ADD CONSTRAINT [SectionStudentFactsAggregatedTitleIEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[SectionStudentFactsStudentsEnrolled] --
CREATE TABLE [tpdm].[SectionStudentFactsStudentsEnrolled] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ValueTypeDescriptorId] [INT] NULL,
    [NumberStudentsEnrolled] [INT] NULL,
    [PercentAtRisk] [DECIMAL](5, 4) NULL,
    [PercentMobility] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionStudentFactsStudentsEnrolled_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[SectionStudentFactsStudentsEnrolled] ADD CONSTRAINT [SectionStudentFactsStudentsEnrolled_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffApplicantAssociation] --
CREATE TABLE [tpdm].[StaffApplicantAssociation] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffApplicantAssociation_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffApplicantAssociation] ADD CONSTRAINT [StaffApplicantAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffApplicantAssociation] ADD CONSTRAINT [StaffApplicantAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffApplicantAssociation] ADD CONSTRAINT [StaffApplicantAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffBackgroundCheck] --
CREATE TABLE [tpdm].[StaffBackgroundCheck] (
    [BackgroundCheckTypeDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [BackgroundCheckRequestedDate] [DATE] NOT NULL,
    [BackgroundCheckStatusDescriptorId] [INT] NULL,
    [BackgroundCheckCompletedDate] [DATE] NULL,
    [Fingerprint] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffBackgroundCheck_PK] PRIMARY KEY CLUSTERED (
        [BackgroundCheckTypeDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffBackgroundCheck] ADD CONSTRAINT [StaffBackgroundCheck_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffEducationOrganizationAssignmentAssociationExtension] --
CREATE TABLE [tpdm].[StaffEducationOrganizationAssignmentAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffClassificationDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [YearsOfExperienceAtCurrentEducationOrganization] [DECIMAL](5, 2) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [StaffClassificationDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEducationOrganizationAssignmentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffEvaluation] --
CREATE TABLE [tpdm].[StaffEvaluation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [MaxRating] [DECIMAL](6, 3) NOT NULL,
    [MinRating] [DECIMAL](6, 3) NULL,
    [StaffEvaluationPeriodDescriptorId] [INT] NULL,
    [StaffEvaluationTypeDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEvaluation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluation] ADD CONSTRAINT [StaffEvaluation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffEvaluation] ADD CONSTRAINT [StaffEvaluation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffEvaluation] ADD CONSTRAINT [StaffEvaluation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffEvaluationComponent] --
CREATE TABLE [tpdm].[StaffEvaluationComponent] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EvaluationComponent] [NVARCHAR](50) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [MaxRating] [DECIMAL](6, 3) NOT NULL,
    [MinRating] [DECIMAL](6, 3) NULL,
    [RubricReference] [NVARCHAR](255) NULL,
    [StaffEvaluationTypeDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEvaluationComponent_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EvaluationComponent] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponent] ADD CONSTRAINT [StaffEvaluationComponent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponent] ADD CONSTRAINT [StaffEvaluationComponent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponent] ADD CONSTRAINT [StaffEvaluationComponent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffEvaluationComponentRating] --
CREATE TABLE [tpdm].[StaffEvaluationComponentRating] (
    [ComponentRating] [DECIMAL](6, 3) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [EvaluationComponent] [NVARCHAR](50) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationDate] [DATE] NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [StaffEvaluationRatingLevelDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEvaluationComponentRating_PK] PRIMARY KEY CLUSTERED (
        [ComponentRating] ASC,
        [EducationOrganizationId] ASC,
        [EvaluationComponent] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationDate] ASC,
        [StaffEvaluationTitle] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponentRating] ADD CONSTRAINT [StaffEvaluationComponentRating_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponentRating] ADD CONSTRAINT [StaffEvaluationComponentRating_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponentRating] ADD CONSTRAINT [StaffEvaluationComponentRating_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffEvaluationComponentStaffRatingLevel] --
CREATE TABLE [tpdm].[StaffEvaluationComponentStaffRatingLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EvaluationComponent] [NVARCHAR](50) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationLevel] [NVARCHAR](50) NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [MaxLevel] [DECIMAL](6, 3) NOT NULL,
    [MinLevel] [DECIMAL](6, 3) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEvaluationComponentStaffRatingLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EvaluationComponent] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationLevel] ASC,
        [StaffEvaluationTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationComponentStaffRatingLevel] ADD CONSTRAINT [StaffEvaluationComponentStaffRatingLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffEvaluationElement] --
CREATE TABLE [tpdm].[StaffEvaluationElement] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EvaluationComponent] [NVARCHAR](50) NOT NULL,
    [EvaluationElement] [NVARCHAR](255) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [MaxRating] [DECIMAL](6, 3) NOT NULL,
    [MinRating] [DECIMAL](6, 3) NULL,
    [RubricReference] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEvaluationElement_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EvaluationComponent] ASC,
        [EvaluationElement] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationElement] ADD CONSTRAINT [StaffEvaluationElement_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffEvaluationElement] ADD CONSTRAINT [StaffEvaluationElement_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffEvaluationElement] ADD CONSTRAINT [StaffEvaluationElement_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffEvaluationElementRating] --
CREATE TABLE [tpdm].[StaffEvaluationElementRating] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EvaluationComponent] [NVARCHAR](50) NOT NULL,
    [EvaluationElement] [NVARCHAR](255) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationDate] [DATE] NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [ElementRating] [DECIMAL](6, 3) NOT NULL,
    [StaffEvaluationRatingLevelDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEvaluationElementRating_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EvaluationComponent] ASC,
        [EvaluationElement] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationDate] ASC,
        [StaffEvaluationTitle] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationElementRating] ADD CONSTRAINT [StaffEvaluationElementRating_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffEvaluationElementRating] ADD CONSTRAINT [StaffEvaluationElementRating_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffEvaluationElementRating] ADD CONSTRAINT [StaffEvaluationElementRating_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffEvaluationElementStaffRatingLevel] --
CREATE TABLE [tpdm].[StaffEvaluationElementStaffRatingLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EvaluationComponent] [NVARCHAR](50) NOT NULL,
    [EvaluationElement] [NVARCHAR](255) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationLevel] [NVARCHAR](50) NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [MaxLevel] [DECIMAL](6, 3) NOT NULL,
    [MinLevel] [DECIMAL](6, 3) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEvaluationElementStaffRatingLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EvaluationComponent] ASC,
        [EvaluationElement] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationLevel] ASC,
        [StaffEvaluationTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationElementStaffRatingLevel] ADD CONSTRAINT [StaffEvaluationElementStaffRatingLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffEvaluationPeriodDescriptor] --
CREATE TABLE [tpdm].[StaffEvaluationPeriodDescriptor] (
    [StaffEvaluationPeriodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffEvaluationPeriodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffEvaluationPeriodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[StaffEvaluationRating] --
CREATE TABLE [tpdm].[StaffEvaluationRating] (
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationDate] [DATE] NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [Rating] [DECIMAL](6, 3) NOT NULL,
    [StaffEvaluationRatingLevelDescriptorId] [INT] NULL,
    [EvaluatedByStaffUSI] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEvaluationRating_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationDate] ASC,
        [StaffEvaluationTitle] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationRating] ADD CONSTRAINT [StaffEvaluationRating_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffEvaluationRating] ADD CONSTRAINT [StaffEvaluationRating_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffEvaluationRating] ADD CONSTRAINT [StaffEvaluationRating_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffEvaluationRatingLevelDescriptor] --
CREATE TABLE [tpdm].[StaffEvaluationRatingLevelDescriptor] (
    [StaffEvaluationRatingLevelDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffEvaluationRatingLevelDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffEvaluationRatingLevelDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[StaffEvaluationStaffRatingLevel] --
CREATE TABLE [tpdm].[StaffEvaluationStaffRatingLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffEvaluationLevel] [NVARCHAR](50) NOT NULL,
    [StaffEvaluationTitle] [NVARCHAR](50) NOT NULL,
    [MaxLevel] [DECIMAL](6, 3) NOT NULL,
    [MinLevel] [DECIMAL](6, 3) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEvaluationStaffRatingLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StaffEvaluationLevel] ASC,
        [StaffEvaluationTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffEvaluationStaffRatingLevel] ADD CONSTRAINT [StaffEvaluationStaffRatingLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffEvaluationTypeDescriptor] --
CREATE TABLE [tpdm].[StaffEvaluationTypeDescriptor] (
    [StaffEvaluationTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffEvaluationTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffEvaluationTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[StaffExtension] --
CREATE TABLE [tpdm].[StaffExtension] (
    [StaffUSI] [INT] NOT NULL,
    [ProbationCompleteDate] [DATE] NULL,
    [Tenured] [BIT] NULL,
    [GenderDescriptorId] [INT] NULL,
    [TenureTrack] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffExtension_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffExtension] ADD CONSTRAINT [StaffExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffFieldworkAbsenceEvent] --
CREATE TABLE [tpdm].[StaffFieldworkAbsenceEvent] (
    [AbsenceEventCategoryDescriptorId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [AbsenceEventReason] [NVARCHAR](255) NULL,
    [HoursAbsent] [DECIMAL](3, 2) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffFieldworkAbsenceEvent_PK] PRIMARY KEY CLUSTERED (
        [AbsenceEventCategoryDescriptorId] ASC,
        [EventDate] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] ADD CONSTRAINT [StaffFieldworkAbsenceEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] ADD CONSTRAINT [StaffFieldworkAbsenceEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] ADD CONSTRAINT [StaffFieldworkAbsenceEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffFieldworkExperience] --
CREATE TABLE [tpdm].[StaffFieldworkExperience] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [FieldworkTypeDescriptorId] [INT] NOT NULL,
    [HoursCompleted] [DECIMAL](5, 2) NULL,
    [EndDate] [DATE] NULL,
    [ProgramGatewayDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffFieldworkExperience_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperience] ADD CONSTRAINT [StaffFieldworkExperience_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperience] ADD CONSTRAINT [StaffFieldworkExperience_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperience] ADD CONSTRAINT [StaffFieldworkExperience_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffFieldworkExperienceCoteaching] --
CREATE TABLE [tpdm].[StaffFieldworkExperienceCoteaching] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [CoteachingBeginDate] [DATE] NOT NULL,
    [CoteachingEndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffFieldworkExperienceCoteaching_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperienceCoteaching] ADD CONSTRAINT [StaffFieldworkExperienceCoteaching_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffFieldworkExperienceSchool] --
CREATE TABLE [tpdm].[StaffFieldworkExperienceSchool] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffFieldworkExperienceSchool_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [SchoolId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperienceSchool] ADD CONSTRAINT [StaffFieldworkExperienceSchool_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffFieldworkExperienceSectionAssociation] --
CREATE TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffFieldworkExperienceSectionAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] ADD CONSTRAINT [StaffFieldworkExperienceSectionAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] ADD CONSTRAINT [StaffFieldworkExperienceSectionAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] ADD CONSTRAINT [StaffFieldworkExperienceSectionAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffHighlyQualifiedAcademicSubject] --
CREATE TABLE [tpdm].[StaffHighlyQualifiedAcademicSubject] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffHighlyQualifiedAcademicSubject_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffHighlyQualifiedAcademicSubject] ADD CONSTRAINT [StaffHighlyQualifiedAcademicSubject_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffProfessionalDevelopmentEventAttendance] --
CREATE TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] (
    [AttendanceDate] [DATE] NOT NULL,
    [ProfessionalDevelopmentTitle] [NVARCHAR](60) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [AttendanceEventReason] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffProfessionalDevelopmentEventAttendance_PK] PRIMARY KEY CLUSTERED (
        [AttendanceDate] ASC,
        [ProfessionalDevelopmentTitle] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [StaffProfessionalDevelopmentEventAttendance_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [StaffProfessionalDevelopmentEventAttendance_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [StaffProfessionalDevelopmentEventAttendance_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffProspectAssociation] --
CREATE TABLE [tpdm].[StaffProspectAssociation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProspectIdentifier] [NVARCHAR](32) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffProspectAssociation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProspectIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffProspectAssociation] ADD CONSTRAINT [StaffProspectAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffProspectAssociation] ADD CONSTRAINT [StaffProspectAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffProspectAssociation] ADD CONSTRAINT [StaffProspectAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffSalary] --
CREATE TABLE [tpdm].[StaffSalary] (
    [StaffUSI] [INT] NOT NULL,
    [SalaryMinRange] [INT] NULL,
    [SalaryMaxRange] [INT] NULL,
    [SalaryTypeDescriptorId] [INT] NULL,
    [SalaryAmount] [MONEY] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffSalary_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffSalary] ADD CONSTRAINT [StaffSalary_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffSeniority] --
CREATE TABLE [tpdm].[StaffSeniority] (
    [CredentialFieldDescriptorId] [INT] NOT NULL,
    [NameOfInstitution] [NVARCHAR](75) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [YearsExperience] [DECIMAL](5, 2) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffSeniority_PK] PRIMARY KEY CLUSTERED (
        [CredentialFieldDescriptorId] ASC,
        [NameOfInstitution] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffSeniority] ADD CONSTRAINT [StaffSeniority_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffStudentGrowthMeasure] --
CREATE TABLE [tpdm].[StaffStudentGrowthMeasure] (
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [StudentGrowthMeasureDate] [DATE] NULL,
    [ResultDatatypeTypeDescriptorId] [INT] NULL,
    [StudentGrowthTypeDescriptorId] [INT] NULL,
    [StudentGrowthTargetScore] [INT] NULL,
    [StudentGrowthActualScore] [INT] NOT NULL,
    [StudentGrowthMet] [BIT] NOT NULL,
    [StudentGrowthNCount] [INT] NULL,
    [StandardError] [DECIMAL](5, 4) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffStudentGrowthMeasure_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [StaffStudentGrowthMeasureIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] ADD CONSTRAINT [StaffStudentGrowthMeasure_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] ADD CONSTRAINT [StaffStudentGrowthMeasure_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] ADD CONSTRAINT [StaffStudentGrowthMeasure_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffStudentGrowthMeasureAcademicSubject] --
CREATE TABLE [tpdm].[StaffStudentGrowthMeasureAcademicSubject] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffStudentGrowthMeasureAcademicSubject_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [StaffStudentGrowthMeasureIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureAcademicSubject] ADD CONSTRAINT [StaffStudentGrowthMeasureAcademicSubject_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffStudentGrowthMeasureCourseAssociation] --
CREATE TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffStudentGrowthMeasureCourseAssociation_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [StaffStudentGrowthMeasureIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureCourseAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureCourseAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureCourseAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] --
CREATE TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffStudentGrowthMeasureEducationOrganizationAssociation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [StaffStudentGrowthMeasureIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureEducationOrganizationAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureEducationOrganizationAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureEducationOrganizationAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffStudentGrowthMeasureGradeLevel] --
CREATE TABLE [tpdm].[StaffStudentGrowthMeasureGradeLevel] (
    [FactAsOfDate] [DATE] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffStudentGrowthMeasureGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [GradeLevelDescriptorId] ASC,
        [SchoolYear] ASC,
        [StaffStudentGrowthMeasureIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureGradeLevel] ADD CONSTRAINT [StaffStudentGrowthMeasureGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffStudentGrowthMeasureSectionAssociation] --
CREATE TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StaffStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffStudentGrowthMeasureSectionAssociation_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StaffStudentGrowthMeasureIdentifier] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureSectionAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureSectionAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ADD CONSTRAINT [StaffStudentGrowthMeasureSectionAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffTeacherEducatorResearch] --
CREATE TABLE [tpdm].[StaffTeacherEducatorResearch] (
    [StaffUSI] [INT] NOT NULL,
    [ResearchExperienceDate] [DATE] NOT NULL,
    [ResearchExperienceTitle] [NVARCHAR](60) NULL,
    [ResearchExperienceDescription] [NVARCHAR](1024) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffTeacherEducatorResearch_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffTeacherEducatorResearch] ADD CONSTRAINT [StaffTeacherEducatorResearch_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffTeacherPreparationProgram] --
CREATE TABLE [tpdm].[StaffTeacherPreparationProgram] (
    [StaffUSI] [INT] NOT NULL,
    [TeacherPreparationProgramName] [NVARCHAR](255) NOT NULL,
    [TeacherPreparationProgramIdentifier] [NVARCHAR](75) NULL,
    [TeacherPreparationProgramTypeDescriptorId] [INT] NOT NULL,
    [NameOfInstitution] [NVARCHAR](75) NOT NULL,
    [MajorSpecialization] [NVARCHAR](75) NOT NULL,
    [GPA] [DECIMAL](18, 4) NULL,
    [LevelOfDegreeAwardedDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffTeacherPreparationProgram_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC,
        [TeacherPreparationProgramName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProgram] ADD CONSTRAINT [StaffTeacherPreparationProgram_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffTeacherPreparationProviderAssociation] --
CREATE TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] (
    [StaffUSI] [INT] NOT NULL,
    [TeacherPreparationProviderId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [ProgramAssignmentDescriptorId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffTeacherPreparationProviderAssociation_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC,
        [TeacherPreparationProviderId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] ADD CONSTRAINT [StaffTeacherPreparationProviderAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] ADD CONSTRAINT [StaffTeacherPreparationProviderAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] ADD CONSTRAINT [StaffTeacherPreparationProviderAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] --
CREATE TABLE [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [TeacherPreparationProviderId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffTeacherPreparationProviderAssociationAcademicSubject_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [StaffUSI] ASC,
        [TeacherPreparationProviderId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] ADD CONSTRAINT [StaffTeacherPreparationProviderAssociationAcademicSubject_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] --
CREATE TABLE [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] (
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [TeacherPreparationProviderId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffTeacherPreparationProviderAssociationGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [GradeLevelDescriptorId] ASC,
        [StaffUSI] ASC,
        [TeacherPreparationProviderId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] ADD CONSTRAINT [StaffTeacherPreparationProviderAssociationGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StaffTeacherPreparationProviderProgramAssociation] --
CREATE TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](255) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [StudentRecordAccess] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffTeacherPreparationProviderProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ADD CONSTRAINT [StaffTeacherPreparationProviderProgramAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ADD CONSTRAINT [StaffTeacherPreparationProviderProgramAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ADD CONSTRAINT [StaffTeacherPreparationProviderProgramAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[StateEducationAgencyExtension] --
CREATE TABLE [tpdm].[StateEducationAgencyExtension] (
    [StateEducationAgencyId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StateEducationAgencyExtension_PK] PRIMARY KEY CLUSTERED (
        [StateEducationAgencyId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StateEducationAgencyExtension] ADD CONSTRAINT [StateEducationAgencyExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StudentGradebookEntryExtension] --
CREATE TABLE [tpdm].[StudentGradebookEntryExtension] (
    [BeginDate] [DATE] NOT NULL,
    [DateAssigned] [DATE] NOT NULL,
    [GradebookEntryTitle] [NVARCHAR](60) NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DateCompleted] [DATE] NULL,
    [AssignmentPassed] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGradebookEntryExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [DateAssigned] ASC,
        [GradebookEntryTitle] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[StudentGradebookEntryExtension] ADD CONSTRAINT [StudentGradebookEntryExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[StudentGrowthTypeDescriptor] --
CREATE TABLE [tpdm].[StudentGrowthTypeDescriptor] (
    [StudentGrowthTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentGrowthTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentGrowthTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[SurveyLevelDescriptor] --
CREATE TABLE [tpdm].[SurveyLevelDescriptor] (
    [SurveyLevelDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SurveyLevelDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SurveyLevelDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[TalentManagementGoal] --
CREATE TABLE [tpdm].[TalentManagementGoal] (
    [GoalTitle] [NVARCHAR](255) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [GoalValue] [DECIMAL](12, 3) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TalentManagementGoal_PK] PRIMARY KEY CLUSTERED (
        [GoalTitle] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TalentManagementGoal] ADD CONSTRAINT [TalentManagementGoal_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TalentManagementGoal] ADD CONSTRAINT [TalentManagementGoal_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TalentManagementGoal] ADD CONSTRAINT [TalentManagementGoal_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TalentManagementGoalEducationOrganization] --
CREATE TABLE [tpdm].[TalentManagementGoalEducationOrganization] (
    [EducationOrganizationId] [INT] NOT NULL,
    [GoalTitle] [NVARCHAR](255) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TalentManagementGoalEducationOrganization_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GoalTitle] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TalentManagementGoalEducationOrganization] ADD CONSTRAINT [TalentManagementGoalEducationOrganization_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidate] --
CREATE TABLE [tpdm].[TeacherCandidate] (
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [PersonalTitlePrefix] [NVARCHAR](30) NULL,
    [FirstName] [NVARCHAR](75) NOT NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [MaidenName] [NVARCHAR](75) NULL,
    [SexDescriptorId] [INT] NOT NULL,
    [BirthDate] [DATE] NOT NULL,
    [BirthCity] [NVARCHAR](30) NULL,
    [BirthStateAbbreviationDescriptorId] [INT] NULL,
    [BirthInternationalProvince] [NVARCHAR](150) NULL,
    [BirthCountryDescriptorId] [INT] NULL,
    [DateEnteredUS] [DATE] NULL,
    [MultipleBirthStatus] [BIT] NULL,
    [BirthSexDescriptorId] [INT] NULL,
    [ProfileThumbnail] [NVARCHAR](255) NULL,
    [HispanicLatinoEthnicity] [BIT] NULL,
    [OldEthnicityDescriptorId] [INT] NULL,
    [CitizenshipStatusDescriptorId] [INT] NULL,
    [EconomicDisadvantaged] [BIT] NULL,
    [LimitedEnglishProficiencyDescriptorId] [INT] NULL,
    [DisplacementStatus] [NVARCHAR](30) NULL,
    [LoginId] [NVARCHAR](60) NULL,
    [GenderDescriptorId] [INT] NULL,
    [TuitionCost] [MONEY] NULL,
    [EnglishLanguageExamDescriptorId] [INT] NULL,
    [PreviousCareerDescriptorId] [INT] NULL,
    [ProgramComplete] [BIT] NULL,
    [FirstGenerationStudent] [BIT] NULL,
    [StudentUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidate_PK] PRIMARY KEY CLUSTERED (
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidate] ADD CONSTRAINT [TeacherCandidate_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidate] ADD CONSTRAINT [TeacherCandidate_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidate] ADD CONSTRAINT [TeacherCandidate_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateAcademicRecord] --
CREATE TABLE [tpdm].[TeacherCandidateAcademicRecord] (
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [CumulativeEarnedCredits] [DECIMAL](9, 3) NULL,
    [CumulativeEarnedCreditTypeDescriptorId] [INT] NULL,
    [CumulativeEarnedCreditConversion] [DECIMAL](9, 2) NULL,
    [CumulativeAttemptedCredits] [DECIMAL](9, 3) NULL,
    [CumulativeAttemptedCreditTypeDescriptorId] [INT] NULL,
    [CumulativeAttemptedCreditConversion] [DECIMAL](9, 2) NULL,
    [CumulativeGradePointsEarned] [DECIMAL](18, 4) NULL,
    [CumulativeGradePointAverage] [DECIMAL](18, 4) NULL,
    [GradeValueQualifier] [NVARCHAR](80) NULL,
    [ProjectedGraduationDate] [DATE] NULL,
    [SessionEarnedCredits] [DECIMAL](9, 3) NULL,
    [SessionEarnedCreditTypeDescriptorId] [INT] NULL,
    [SessionEarnedCreditConversion] [DECIMAL](9, 2) NULL,
    [SessionAttemptedCredits] [DECIMAL](9, 3) NULL,
    [SessionAttemptedCreditTypeDescriptorId] [INT] NULL,
    [SessionAttemptedCreditConversion] [DECIMAL](9, 2) NULL,
    [SessionGradePointsEarned] [DECIMAL](18, 4) NULL,
    [SessionGradePointAverage] [DECIMAL](18, 4) NULL,
    [ContentGradePointAverage] [DECIMAL](18, 4) NULL,
    [ContentGradePointEarned] [DECIMAL](18, 4) NULL,
    [ProgramGatewayDescriptorId] [INT] NOT NULL,
    [TPPDegreeTypeDescriptorId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateAcademicRecord_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] ADD CONSTRAINT [TeacherCandidateAcademicRecord_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] ADD CONSTRAINT [TeacherCandidateAcademicRecord_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] ADD CONSTRAINT [TeacherCandidateAcademicRecord_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] --
CREATE TABLE [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] (
    [AcademicHonorCategoryDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [HonorDescription] [NVARCHAR](80) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AchievementTitle] [NVARCHAR](60) NULL,
    [AchievementCategoryDescriptorId] [INT] NULL,
    [AchievementCategorySystem] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerOriginURL] [NVARCHAR](255) NULL,
    [Criteria] [NVARCHAR](150) NULL,
    [CriteriaURL] [NVARCHAR](255) NULL,
    [EvidenceStatement] [NVARCHAR](150) NULL,
    [ImageURL] [NVARCHAR](255) NULL,
    [HonorAwardDate] [DATE] NULL,
    [HonorAwardExpiresDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAcademicRecordAcademicHonor_PK] PRIMARY KEY CLUSTERED (
        [AcademicHonorCategoryDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [HonorDescription] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] ADD CONSTRAINT [TeacherCandidateAcademicRecordAcademicHonor_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAcademicRecordClassRanking] --
CREATE TABLE [tpdm].[TeacherCandidateAcademicRecordClassRanking] (
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [ClassRank] [INT] NOT NULL,
    [TotalNumberInClass] [INT] NOT NULL,
    [PercentageRanking] [INT] NULL,
    [ClassRankingDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAcademicRecordClassRanking_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordClassRanking] ADD CONSTRAINT [TeacherCandidateAcademicRecordClassRanking_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAcademicRecordDiploma] --
CREATE TABLE [tpdm].[TeacherCandidateAcademicRecordDiploma] (
    [DiplomaAwardDate] [DATE] NOT NULL,
    [DiplomaTypeDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AchievementTitle] [NVARCHAR](60) NULL,
    [AchievementCategoryDescriptorId] [INT] NULL,
    [AchievementCategorySystem] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerOriginURL] [NVARCHAR](255) NULL,
    [Criteria] [NVARCHAR](150) NULL,
    [CriteriaURL] [NVARCHAR](255) NULL,
    [EvidenceStatement] [NVARCHAR](150) NULL,
    [ImageURL] [NVARCHAR](255) NULL,
    [DiplomaLevelDescriptorId] [INT] NULL,
    [CTECompleter] [BIT] NULL,
    [DiplomaDescription] [NVARCHAR](80) NULL,
    [DiplomaAwardExpiresDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAcademicRecordDiploma_PK] PRIMARY KEY CLUSTERED (
        [DiplomaAwardDate] ASC,
        [DiplomaTypeDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordDiploma] ADD CONSTRAINT [TeacherCandidateAcademicRecordDiploma_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] --
CREATE TABLE [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] (
    [EducationOrganizationId] [INT] NOT NULL,
    [GradePointAverageTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [IsCumulative] [BIT] NULL,
    [GradePointAverageValue] [DECIMAL](18, 4) NOT NULL,
    [MaxGradePointAverageValue] [DECIMAL](18, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAcademicRecordGradePointAverage_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GradePointAverageTypeDescriptorId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] ADD CONSTRAINT [TeacherCandidateAcademicRecordGradePointAverage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAcademicRecordRecognition] --
CREATE TABLE [tpdm].[TeacherCandidateAcademicRecordRecognition] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RecognitionTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AchievementTitle] [NVARCHAR](60) NULL,
    [AchievementCategoryDescriptorId] [INT] NULL,
    [AchievementCategorySystem] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerOriginURL] [NVARCHAR](255) NULL,
    [Criteria] [NVARCHAR](150) NULL,
    [CriteriaURL] [NVARCHAR](255) NULL,
    [EvidenceStatement] [NVARCHAR](150) NULL,
    [ImageURL] [NVARCHAR](255) NULL,
    [RecognitionDescription] [NVARCHAR](80) NULL,
    [RecognitionAwardDate] [DATE] NULL,
    [RecognitionAwardExpiresDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAcademicRecordRecognition_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RecognitionTypeDescriptorId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordRecognition] ADD CONSTRAINT [TeacherCandidateAcademicRecordRecognition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAddress] --
CREATE TABLE [tpdm].[TeacherCandidateAddress] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [ApartmentRoomSuiteNumber] [NVARCHAR](50) NULL,
    [BuildingSiteNumber] [NVARCHAR](20) NULL,
    [NameOfCounty] [NVARCHAR](30) NULL,
    [CountyFIPSCode] [NVARCHAR](5) NULL,
    [Latitude] [NVARCHAR](20) NULL,
    [Longitude] [NVARCHAR](20) NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CongressionalDistrict] [NVARCHAR](30) NULL,
    [LocaleDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAddress_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAddress] ADD CONSTRAINT [TeacherCandidateAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAddressPeriod] --
CREATE TABLE [tpdm].[TeacherCandidateAddressPeriod] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAddressPeriod_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [BeginDate] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAddressPeriod] ADD CONSTRAINT [TeacherCandidateAddressPeriod_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateAid] --
CREATE TABLE [tpdm].[TeacherCandidateAid] (
    [AidTypeDescriptorId] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [EndDate] [DATE] NULL,
    [AidConditionDescription] [NVARCHAR](1024) NULL,
    [AidAmount] [MONEY] NULL,
    [PellGrantRecipient] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateAid_PK] PRIMARY KEY CLUSTERED (
        [AidTypeDescriptorId] ASC,
        [BeginDate] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateAid] ADD CONSTRAINT [TeacherCandidateAid_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateBackgroundCheck] --
CREATE TABLE [tpdm].[TeacherCandidateBackgroundCheck] (
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [BackgroundCheckTypeDescriptorId] [INT] NOT NULL,
    [BackgroundCheckRequestedDate] [DATE] NOT NULL,
    [BackgroundCheckStatusDescriptorId] [INT] NULL,
    [BackgroundCheckCompletedDate] [DATE] NULL,
    [Fingerprint] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateBackgroundCheck_PK] PRIMARY KEY CLUSTERED (
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateBackgroundCheck] ADD CONSTRAINT [TeacherCandidateBackgroundCheck_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateCharacteristic] --
CREATE TABLE [tpdm].[TeacherCandidateCharacteristic] (
    [StudentCharacteristicDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [DesignatedBy] [NVARCHAR](60) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateCharacteristic_PK] PRIMARY KEY CLUSTERED (
        [StudentCharacteristicDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateCharacteristic] ADD CONSTRAINT [TeacherCandidateCharacteristic_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateCharacteristicDescriptor] --
CREATE TABLE [tpdm].[TeacherCandidateCharacteristicDescriptor] (
    [TeacherCandidateCharacteristicDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TeacherCandidateCharacteristicDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TeacherCandidateCharacteristicDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[TeacherCandidateCohortYear] --
CREATE TABLE [tpdm].[TeacherCandidateCohortYear] (
    [CohortYearTypeDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateCohortYear_PK] PRIMARY KEY CLUSTERED (
        [CohortYearTypeDescriptorId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateCohortYear] ADD CONSTRAINT [TeacherCandidateCohortYear_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateCourseTranscript] --
CREATE TABLE [tpdm].[TeacherCandidateCourseTranscript] (
    [CourseAttemptResultDescriptorId] [INT] NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [CourseEducationOrganizationId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [AttemptedCredits] [DECIMAL](9, 3) NULL,
    [AttemptedCreditTypeDescriptorId] [INT] NULL,
    [AttemptedCreditConversion] [DECIMAL](9, 2) NULL,
    [EarnedCredits] [DECIMAL](9, 3) NOT NULL,
    [EarnedCreditTypeDescriptorId] [INT] NULL,
    [EarnedCreditConversion] [DECIMAL](9, 2) NULL,
    [WhenTakenGradeLevelDescriptorId] [INT] NULL,
    [MethodCreditEarnedDescriptorId] [INT] NULL,
    [FinalLetterGradeEarned] [NVARCHAR](20) NULL,
    [FinalNumericGradeEarned] [DECIMAL](9, 2) NULL,
    [CourseRepeatCodeDescriptorId] [INT] NULL,
    [SchoolId] [INT] NULL,
    [CourseTitle] [NVARCHAR](60) NULL,
    [AlternativeCourseTitle] [NVARCHAR](60) NULL,
    [AlternativeCourseCode] [NVARCHAR](60) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateCourseTranscript_PK] PRIMARY KEY CLUSTERED (
        [CourseAttemptResultDescriptorId] ASC,
        [CourseCode] ASC,
        [CourseEducationOrganizationId] ASC,
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] ADD CONSTRAINT [TeacherCandidateCourseTranscript_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] ADD CONSTRAINT [TeacherCandidateCourseTranscript_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] ADD CONSTRAINT [TeacherCandidateCourseTranscript_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] --
CREATE TABLE [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] (
    [AdditionalCreditTypeDescriptorId] [INT] NOT NULL,
    [CourseAttemptResultDescriptorId] [INT] NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [CourseEducationOrganizationId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [Credits] [DECIMAL](9, 3) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateCourseTranscriptEarnedAdditionalCredits_PK] PRIMARY KEY CLUSTERED (
        [AdditionalCreditTypeDescriptorId] ASC,
        [CourseAttemptResultDescriptorId] ASC,
        [CourseCode] ASC,
        [CourseEducationOrganizationId] ASC,
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] ADD CONSTRAINT [TeacherCandidateCourseTranscriptEarnedAdditionalCredits_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateCredential] --
CREATE TABLE [tpdm].[TeacherCandidateCredential] (
    [CredentialIdentifier] [NVARCHAR](60) NOT NULL,
    [StateOfIssueStateAbbreviationDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateCredential_PK] PRIMARY KEY CLUSTERED (
        [CredentialIdentifier] ASC,
        [StateOfIssueStateAbbreviationDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateCredential] ADD CONSTRAINT [TeacherCandidateCredential_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateDegreeSpecialization] --
CREATE TABLE [tpdm].[TeacherCandidateDegreeSpecialization] (
    [BeginDate] [DATE] NOT NULL,
    [MajorSpecialization] [NVARCHAR](75) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [MinorSpecialization] [NVARCHAR](75) NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateDegreeSpecialization_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [MajorSpecialization] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateDegreeSpecialization] ADD CONSTRAINT [TeacherCandidateDegreeSpecialization_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateDisability] --
CREATE TABLE [tpdm].[TeacherCandidateDisability] (
    [DisabilityDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [DisabilityDiagnosis] [NVARCHAR](80) NULL,
    [OrderOfDisability] [INT] NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateDisability_PK] PRIMARY KEY CLUSTERED (
        [DisabilityDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateDisability] ADD CONSTRAINT [TeacherCandidateDisability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateDisabilityDesignation] --
CREATE TABLE [tpdm].[TeacherCandidateDisabilityDesignation] (
    [DisabilityDescriptorId] [INT] NOT NULL,
    [DisabilityDesignationDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateDisabilityDesignation_PK] PRIMARY KEY CLUSTERED (
        [DisabilityDescriptorId] ASC,
        [DisabilityDesignationDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateDisabilityDesignation] ADD CONSTRAINT [TeacherCandidateDisabilityDesignation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateElectronicMail] --
CREATE TABLE [tpdm].[TeacherCandidateElectronicMail] (
    [ElectronicMailAddress] [NVARCHAR](128) NOT NULL,
    [ElectronicMailTypeDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [PrimaryEmailAddressIndicator] [BIT] NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateElectronicMail_PK] PRIMARY KEY CLUSTERED (
        [ElectronicMailAddress] ASC,
        [ElectronicMailTypeDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateElectronicMail] ADD CONSTRAINT [TeacherCandidateElectronicMail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateFieldworkAbsenceEvent] --
CREATE TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] (
    [AbsenceEventCategoryDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [AbsenceEventReason] [NVARCHAR](255) NULL,
    [HoursAbsent] [DECIMAL](3, 2) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateFieldworkAbsenceEvent_PK] PRIMARY KEY CLUSTERED (
        [AbsenceEventCategoryDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ADD CONSTRAINT [TeacherCandidateFieldworkAbsenceEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ADD CONSTRAINT [TeacherCandidateFieldworkAbsenceEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ADD CONSTRAINT [TeacherCandidateFieldworkAbsenceEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateFieldworkExperience] --
CREATE TABLE [tpdm].[TeacherCandidateFieldworkExperience] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [FieldworkTypeDescriptorId] [INT] NOT NULL,
    [HoursCompleted] [DECIMAL](5, 2) NULL,
    [EndDate] [DATE] NULL,
    [ProgramGatewayDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateFieldworkExperience_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] ADD CONSTRAINT [TeacherCandidateFieldworkExperience_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] ADD CONSTRAINT [TeacherCandidateFieldworkExperience_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] ADD CONSTRAINT [TeacherCandidateFieldworkExperience_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateFieldworkExperienceCoteaching] --
CREATE TABLE [tpdm].[TeacherCandidateFieldworkExperienceCoteaching] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CoteachingBeginDate] [DATE] NOT NULL,
    [CoteachingEndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateFieldworkExperienceCoteaching_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceCoteaching] ADD CONSTRAINT [TeacherCandidateFieldworkExperienceCoteaching_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateFieldworkExperienceSchool] --
CREATE TABLE [tpdm].[TeacherCandidateFieldworkExperienceSchool] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateFieldworkExperienceSchool_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [SchoolId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSchool] ADD CONSTRAINT [TeacherCandidateFieldworkExperienceSchool_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [FieldworkIdentifier] [NVARCHAR](64) NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateFieldworkExperienceSectionAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [FieldworkIdentifier] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ADD CONSTRAINT [TeacherCandidateFieldworkExperienceSectionAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ADD CONSTRAINT [TeacherCandidateFieldworkExperienceSectionAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ADD CONSTRAINT [TeacherCandidateFieldworkExperienceSectionAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateIdentificationCode] --
CREATE TABLE [tpdm].[TeacherCandidateIdentificationCode] (
    [AssigningOrganizationIdentificationCode] [NVARCHAR](60) NOT NULL,
    [StudentIdentificationSystemDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [IdentificationCode] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateIdentificationCode_PK] PRIMARY KEY CLUSTERED (
        [AssigningOrganizationIdentificationCode] ASC,
        [StudentIdentificationSystemDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateIdentificationCode] ADD CONSTRAINT [TeacherCandidateIdentificationCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateIdentificationDocument] --
CREATE TABLE [tpdm].[TeacherCandidateIdentificationDocument] (
    [IdentificationDocumentUseDescriptorId] [INT] NOT NULL,
    [PersonalInformationVerificationDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [DocumentTitle] [NVARCHAR](60) NULL,
    [DocumentExpirationDate] [DATE] NULL,
    [IssuerDocumentIdentificationCode] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerCountryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateIdentificationDocument_PK] PRIMARY KEY CLUSTERED (
        [IdentificationDocumentUseDescriptorId] ASC,
        [PersonalInformationVerificationDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateIdentificationDocument] ADD CONSTRAINT [TeacherCandidateIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateIndicator] --
CREATE TABLE [tpdm].[TeacherCandidateIndicator] (
    [IndicatorName] [NVARCHAR](200) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [IndicatorGroup] [NVARCHAR](200) NULL,
    [Indicator] [NVARCHAR](35) NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [DesignatedBy] [NVARCHAR](60) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateIndicator_PK] PRIMARY KEY CLUSTERED (
        [IndicatorName] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateIndicator] ADD CONSTRAINT [TeacherCandidateIndicator_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateInternationalAddress] --
CREATE TABLE [tpdm].[TeacherCandidateInternationalAddress] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [AddressLine1] [NVARCHAR](150) NOT NULL,
    [AddressLine2] [NVARCHAR](150) NULL,
    [AddressLine3] [NVARCHAR](150) NULL,
    [AddressLine4] [NVARCHAR](150) NULL,
    [CountryDescriptorId] [INT] NOT NULL,
    [Latitude] [NVARCHAR](20) NULL,
    [Longitude] [NVARCHAR](20) NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateInternationalAddress_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateInternationalAddress] ADD CONSTRAINT [TeacherCandidateInternationalAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateLanguage] --
CREATE TABLE [tpdm].[TeacherCandidateLanguage] (
    [LanguageDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateLanguage_PK] PRIMARY KEY CLUSTERED (
        [LanguageDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateLanguage] ADD CONSTRAINT [TeacherCandidateLanguage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateLanguageUse] --
CREATE TABLE [tpdm].[TeacherCandidateLanguageUse] (
    [LanguageDescriptorId] [INT] NOT NULL,
    [LanguageUseDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateLanguageUse_PK] PRIMARY KEY CLUSTERED (
        [LanguageDescriptorId] ASC,
        [LanguageUseDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateLanguageUse] ADD CONSTRAINT [TeacherCandidateLanguageUse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateOtherName] --
CREATE TABLE [tpdm].[TeacherCandidateOtherName] (
    [OtherNameTypeDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [PersonalTitlePrefix] [NVARCHAR](30) NULL,
    [FirstName] [NVARCHAR](75) NOT NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateOtherName_PK] PRIMARY KEY CLUSTERED (
        [OtherNameTypeDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateOtherName] ADD CONSTRAINT [TeacherCandidateOtherName_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidatePersonalIdentificationDocument] --
CREATE TABLE [tpdm].[TeacherCandidatePersonalIdentificationDocument] (
    [IdentificationDocumentUseDescriptorId] [INT] NOT NULL,
    [PersonalInformationVerificationDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [DocumentTitle] [NVARCHAR](60) NULL,
    [DocumentExpirationDate] [DATE] NULL,
    [IssuerDocumentIdentificationCode] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerCountryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidatePersonalIdentificationDocument_PK] PRIMARY KEY CLUSTERED (
        [IdentificationDocumentUseDescriptorId] ASC,
        [PersonalInformationVerificationDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidatePersonalIdentificationDocument] ADD CONSTRAINT [TeacherCandidatePersonalIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] --
CREATE TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] (
    [AttendanceDate] [DATE] NOT NULL,
    [ProfessionalDevelopmentTitle] [NVARCHAR](60) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [AttendanceEventReason] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateProfessionalDevelopmentEventAttendance_PK] PRIMARY KEY CLUSTERED (
        [AttendanceDate] ASC,
        [ProfessionalDevelopmentTitle] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [TeacherCandidateProfessionalDevelopmentEventAttendance_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [TeacherCandidateProfessionalDevelopmentEventAttendance_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ADD CONSTRAINT [TeacherCandidateProfessionalDevelopmentEventAttendance_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateRace] --
CREATE TABLE [tpdm].[TeacherCandidateRace] (
    [RaceDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateRace_PK] PRIMARY KEY CLUSTERED (
        [RaceDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateRace] ADD CONSTRAINT [TeacherCandidateRace_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateStaffAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateStaffAssociation] (
    [StaffUSI] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateStaffAssociation_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] ADD CONSTRAINT [TeacherCandidateStaffAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] ADD CONSTRAINT [TeacherCandidateStaffAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] ADD CONSTRAINT [TeacherCandidateStaffAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateStudentGrowthMeasure] --
CREATE TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] (
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherCandidateStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [StudentGrowthMeasureDate] [DATE] NULL,
    [ResultDatatypeTypeDescriptorId] [INT] NULL,
    [StudentGrowthTypeDescriptorId] [INT] NULL,
    [StudentGrowthTargetScore] [INT] NULL,
    [StudentGrowthActualScore] [INT] NOT NULL,
    [StudentGrowthMet] [BIT] NOT NULL,
    [StudentGrowthNCount] [INT] NULL,
    [StandardError] [DECIMAL](5, 4) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateStudentGrowthMeasure_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherCandidateStudentGrowthMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasure_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasure_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasure_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] --
CREATE TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherCandidateStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateStudentGrowthMeasureAcademicSubject_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherCandidateStudentGrowthMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureAcademicSubject_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherCandidateStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateStudentGrowthMeasureCourseAssociation_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherCandidateStudentGrowthMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureCourseAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureCourseAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureCourseAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FactAsOfDate] [DATE] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherCandidateStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [FactAsOfDate] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherCandidateStudentGrowthMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] --
CREATE TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] (
    [FactAsOfDate] [DATE] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherCandidateStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateStudentGrowthMeasureGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [GradeLevelDescriptorId] ASC,
        [SchoolYear] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherCandidateStudentGrowthMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] (
    [FactAsOfDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherCandidateStudentGrowthMeasureIdentifier] [NVARCHAR](64) NOT NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateStudentGrowthMeasureSectionAssociation_PK] PRIMARY KEY CLUSTERED (
        [FactAsOfDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherCandidateStudentGrowthMeasureIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureSectionAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureSectionAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ADD CONSTRAINT [TeacherCandidateStudentGrowthMeasureSectionAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] (
    [EntryDate] [DATE] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TeacherPreparationProviderId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NULL,
    [EntryTypeDescriptorId] [INT] NULL,
    [ExitWithdrawDate] [DATE] NULL,
    [ExitWithdrawTypeDescriptorId] [INT] NULL,
    [ClassOfSchoolYear] [SMALLINT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateTeacherPreparationProviderAssociation_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TeacherPreparationProviderId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ADD CONSTRAINT [TeacherCandidateTeacherPreparationProviderAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ADD CONSTRAINT [TeacherCandidateTeacherPreparationProviderAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ADD CONSTRAINT [TeacherCandidateTeacherPreparationProviderAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] --
CREATE TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](255) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [EndDate] [DATE] NULL,
    [ReasonExitedDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherCandidateTeacherPreparationProviderProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ADD CONSTRAINT [TeacherCandidateTeacherPreparationProviderProgramAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ADD CONSTRAINT [TeacherCandidateTeacherPreparationProviderProgramAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ADD CONSTRAINT [TeacherCandidateTeacherPreparationProviderProgramAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherCandidateTelephone] --
CREATE TABLE [tpdm].[TeacherCandidateTelephone] (
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TelephoneNumber] [NVARCHAR](24) NOT NULL,
    [TelephoneNumberTypeDescriptorId] [INT] NOT NULL,
    [OrderOfPriority] [INT] NULL,
    [TextMessageCapabilityIndicator] [BIT] NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateTelephone_PK] PRIMARY KEY CLUSTERED (
        [TeacherCandidateIdentifier] ASC,
        [TelephoneNumber] ASC,
        [TelephoneNumberTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateTelephone] ADD CONSTRAINT [TeacherCandidateTelephone_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateTPPProgramDegree] --
CREATE TABLE [tpdm].[TeacherCandidateTPPProgramDegree] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [TPPDegreeTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateTPPProgramDegree_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [GradeLevelDescriptorId] ASC,
        [TeacherCandidateIdentifier] ASC,
        [TPPDegreeTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateTPPProgramDegree] ADD CONSTRAINT [TeacherCandidateTPPProgramDegree_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherCandidateVisa] --
CREATE TABLE [tpdm].[TeacherCandidateVisa] (
    [TeacherCandidateIdentifier] [NVARCHAR](32) NOT NULL,
    [VisaDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherCandidateVisa_PK] PRIMARY KEY CLUSTERED (
        [TeacherCandidateIdentifier] ASC,
        [VisaDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherCandidateVisa] ADD CONSTRAINT [TeacherCandidateVisa_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[TeacherPreparationProgramTypeDescriptor] --
CREATE TABLE [tpdm].[TeacherPreparationProgramTypeDescriptor] (
    [TeacherPreparationProgramTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TeacherPreparationProgramTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TeacherPreparationProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[TeacherPreparationProvider] --
CREATE TABLE [tpdm].[TeacherPreparationProvider] (
    [TeacherPreparationProviderId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [UniversityId] [INT] NULL,
    [SchoolId] [INT] NULL,
    CONSTRAINT [TeacherPreparationProvider_PK] PRIMARY KEY CLUSTERED (
        [TeacherPreparationProviderId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[TeacherPreparationProviderProgram] --
CREATE TABLE [tpdm].[TeacherPreparationProviderProgram] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](255) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [ProgramId] [NVARCHAR](20) NULL,
    [MajorSpecialization] [NVARCHAR](75) NULL,
    [MinorSpecialization] [NVARCHAR](75) NULL,
    [TeacherPreparationProgramTypeDescriptorId] [INT] NULL,
    [TPPProgramPathwayDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [TeacherPreparationProviderProgram_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] ADD CONSTRAINT [TeacherPreparationProviderProgram_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] ADD CONSTRAINT [TeacherPreparationProviderProgram_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] ADD CONSTRAINT [TeacherPreparationProviderProgram_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [tpdm].[TeacherPreparationProviderProgramGradeLevel] --
CREATE TABLE [tpdm].[TeacherPreparationProviderProgramGradeLevel] (
    [EducationOrganizationId] [INT] NOT NULL,
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](255) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [TeacherPreparationProviderProgramGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GradeLevelDescriptorId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tpdm].[TeacherPreparationProviderProgramGradeLevel] ADD CONSTRAINT [TeacherPreparationProviderProgramGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [tpdm].[ThemeDescriptor] --
CREATE TABLE [tpdm].[ThemeDescriptor] (
    [ThemeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ThemeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ThemeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[TPPDegreeTypeDescriptor] --
CREATE TABLE [tpdm].[TPPDegreeTypeDescriptor] (
    [TPPDegreeTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TPPDegreeTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TPPDegreeTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[TPPProgramPathwayDescriptor] --
CREATE TABLE [tpdm].[TPPProgramPathwayDescriptor] (
    [TPPProgramPathwayDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TPPProgramPathwayDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TPPProgramPathwayDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[University] --
CREATE TABLE [tpdm].[University] (
    [UniversityId] [INT] NOT NULL,
    [FederalLocaleCodeDescriptorId] [INT] NULL,
    [SchoolId] [INT] NULL,
    CONSTRAINT [University_PK] PRIMARY KEY CLUSTERED (
        [UniversityId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[ValueTypeDescriptor] --
CREATE TABLE [tpdm].[ValueTypeDescriptor] (
    [ValueTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ValueTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ValueTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [tpdm].[WithdrawReasonDescriptor] --
CREATE TABLE [tpdm].[WithdrawReasonDescriptor] (
    [WithdrawReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [WithdrawReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [WithdrawReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

