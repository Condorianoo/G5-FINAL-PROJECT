IF COL_LENGTH('dbo.Claims', 'ProofImagePath') IS NULL
BEGIN
    ALTER TABLE dbo.Claims
    ADD ProofImagePath NVARCHAR(500) NULL;
END
