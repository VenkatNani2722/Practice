SELECT 	S.SeqID, 						S.Parent_SeqID, 			S.UserID,						S.CRFDate,
        S.AccountName,					S.BrandName,				S.ProductID,					S.SolutionID,
        S.CustomerType,					S.Vertical,					S.`Channel`,					S.CRFTransferDate,
        S.PaymentMode,					S.InvoiceDeliveryMode,		S.SalesApprovalStatus,			S.SalesAcceptanceDate,
        S.SalesPendingRemarks,			S.SalesDeactivationRemarks,	S.CommercialID,					S.RecurringPrice,
        S.RecurringQuantity,			S.OTCAmount,				S.OTCRemarks,					S.TransactionID,
        S.SalesInsertDate,				S.PanNumber,				S.GSTNumber,					S.BillingAddress,
        S.Name,							S.Role,						S.PhoneNumber,					S.Email,
        S.IsActivation,					S.SalesAcceptedBy			S.SalesRemarks,					S.PaymentRemarks,
        S.PaymentDate,					S.Currency,					S.AcceptanceInsertDate,			S.DeliveryType,
        S.is_partial,					S.crf_upload_file,			S.SalesCustomerUserID,			S.existing_product,
        S.existing_commercials,			S.existing_quantity,		S.existing_price,				S.invoicing_from,
        S.gst_state,					S.conversion_otc,			S.existing_solution,			S.lead_type,
        S.expansion_type,				S.contraction_type,			S.prorated_invoice_flag,		S.OrderRegion,
        S.isCall,						S.callRates,				S.telcoDetails,					S.SecondaryPartner,
        S.SecondaryPartnerName,			S.CrmIntegration,			S.CrmProvide,					S.EnquiryID,
        A.AccountName,					A.BrandName,				A.AccountType,					F.SalesID,
        F.FinanceRemarks,				F.FinanceApprovalDate,		F.FinancePartialApprovalStatus	F.BillingStatus,
        F.FinancePendingRemarks,		F.InvoiceDate,				F.InvoiceNo,					F.FinanceApprovalStatus,
        F.RevenueInvoiceDeliveryStatus, F.RevenuePendingRemarks,    F.RevenueInvoiceDeliveryMode,	F.RevenueInvoiceDeliveryDate,
        F.ContactPerson,				F.KGMRemarks,				F.CreatedTime,					F.UpdatedTime,
        
		
        
		,AU.username, 
			P.Description AS Product,
			SA.Description AS Solution,
			C.Description AS Commercial,
			F.`FinancePartialApprovalStatus`,
			D.`DeliveryStatus`,
			S.`SalesApprovalStatus`,
			F.`BillingStatus` ,
			IFNULL(D.DeliveryDate,''NA'') AS DeliveryDate,
			IFNULL(S.SalesAcceptanceDate,''NA'') AS SalesAcceptanceDate  
FROM 		Sales S
JOIN		Accounts A  ON S.AccountName = A.AccountName AND S.BrandName = A.BrandName
LEFT JOIN 	Finance F ON S.SeqID=F.SalesSeqID
LEFT JOIN 	Delivery D  ON S.SeqID=D.SalesSeqID 
JOIN 		Products P ON S.ProductID=P.ProductID
JOIN 		Solution SA ON S.SolutionID=SA.SolutionID
JOIN 		Commercials C ON S.CommercialID=C.CommercialID
JOIN 		user_role UR ON S.UserID=UR.user_id
JOIN 		app_user AU ON S.UserID=AU.id