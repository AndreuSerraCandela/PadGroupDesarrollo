report 51201 "Job Quote Pargroup"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Report.50201.JobQuote.rdlc';
    //  WordLayout = './JobQuote.docx';
    Caption = 'Job Quote Pargroup';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(Job; Job)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Planning Date Filter";
            column(CompanyAddress1; CompanyAddr[1])
            {
            }

            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(companyPieLogo; CompanyInfo."Logo Pie") { }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            //maybe
            column(DocumentTitle_Lbl; DocumentTitleLbl) { }
            column(CompanyVATRegNo; CompanyInfo."VAT Registration No.") { }
            column(Direccion1; CompanyInfo.Address) { }
            column(City1; CompanyInfo.County) { }
            column(CodigoPosta1; CompanyInfo."Country/Region Code") { }
            column(EmailCompany; CompanyInfo."E-Mail") { }
            column(DueDate_Lbl; DueDateLbl)
            {
            }
            column(ExternalDocumentNo_Lbl; ExternalDocumentNoLlb)
            {
            }
            column(External_Document_No_; "External Document No.") { }
            column(Your_Reference; "Your Reference") { }
            column(YourReferenceLbl; FieldCaption("Your Reference")) { }
            column(DatosFiscales_Lbl; DatosFiscalesLbl) { }
            column(codOferta; Job."Cód Oferta Job")
            { }


            column(CodOferta_lbl; codOfertaLbl) { }
            Column(legalTextTxt; legalTextTxt) { }
            //maybe

            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(CompanyName; COMPANYPROPERTY.DisplayName)
            {
            }
            column(JobtableCaptJobFilter; TableCaption + ': ' + JobFilter)
            {
            }
            column(JobFilter; JobFilter)
            {
            }
            column(JobTasktableCaptFilter; "Job Task".TableCaption + ': ' + JobTaskFilter)
            {
            }
            column(JobTaskFilter; JobTaskFilter)
            {
            }
            column(No_Job; "No.")
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(JobQuoteCaptLbl; JobQuoteCaptLbl)
            {
            }
            column(BillToAddress1; BillToAddr[1])
            {
            }
            column(BillToAddress2; BillToAddr[2])
            {
            }
            column(BillToAddress3; BillToAddr[3])
            {
            }
            column(BillToAddress4; BillToAddr[4])
            {
            }
            column(BillToAddress5; BillToAddr[5])
            {
            }
            column(BillToAddress6; BillToAddr[6])
            {
            }
            column(VatCustomer; VatCustomer) { }
            column(SimboloEuro; SimboloEuro) { }
            dataitem("Job Task"; "Job Task")
            {
                DataItemLink = "Job No." = FIELD("No.");
                DataItemTableView = SORTING("Job No.", "Job Task No.");
                PrintOnlyIfDetail = true;
                column(JobTaskNo_JobTask; HeaderJobTaskNo)
                {
                }
                column(Indentation_JobTask; HeaderJobTask)
                {
                }
                column(NewTaskGroup; NewTaskGroup)
                {
                }
                column(QuantityCaption; QuantityLbl)
                {
                }
                column(UnitCostCaption; UnitCostLbl)
                {
                }
                column(TotalCostCaption; TotalCostLbl)
                {
                }
                column(JobTaskTypeCaption; JobTaskTypeLbl)
                {
                }
                column(NoCaption; NoLbl)
                {
                }
                column(Description_Job; Job.Description)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(JobTaskNoCapt; JobTaskNoCaptLbl)
                {
                }
                column(TotalJobTask; TotalJobTask)
                {
                }
                column(TotalJob; TotalJob)
                {
                }
                dataitem("Job Planning Line"; "Job Planning Line")
                {
                    DataItemLink = "Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No.");
                    DataItemTableView = SORTING("Job No.", "Job Task No.", "Line No.");
                    RequestFilterFields = "Job Task No.";
                    column(ShowIntBody1; "Job Task"."Job Task Type" in ["Job Task"."Job Task Type"::Heading, "Job Task"."Job Task Type"::"Begin-Total"])
                    {
                    }
                    column(Quantity; Quantity)
                    {
                    }
                    column(UnitCostLCY; "Unit Price (LCY)")
                    {
                    }
                    column(UnitCost; "Unit Price")
                    {
                    }
                    column(TotalCostLCY; "Total Price (LCY)")
                    {
                    }
                    column(TotalCost; "Total Price")
                    {
                    }
                    column(Type; Type)
                    {
                    }
                    column(Number; "No.")
                    {
                    }
                    column(JobPlanningLine_JobTaskNo; "Job Task No.")
                    {
                    }
                    column(JobPlanningLine_Type; Type)
                    {
                    }
                    column(JobPlanningLine_LineType; "Line Type")
                    {
                    }
                    column(Indentation_JobTask2; PadStr('', 2 * "Job Task".Indentation) + Description)
                    {
                    }
                    column(Indentation_JobTaskTotal; PadStr('', 2 * "Job Task".Indentation) + Description)
                    {
                    }
                    column(ShowIntBody2; "Job Task"."Job Task Type" in ["Job Task"."Job Task Type"::Total, "Job Task"."Job Task Type"::"End-Total"])
                    {
                    }
                    column(ShowIntBody3; ("Job Task"."Job Task Type" in ["Job Task"."Job Task Type"::Posting]) and PrintSection)
                    {
                    }
                    column(TotalJobLbl; TotalJobLbl) { }

                    trigger OnAfterGetRecord()
                    begin
                        PrintSection := true;
                        if "Line Type" = "Line Type"::Budget then begin
                            PrintSection := false;
                            CurrReport.Skip();
                        end;
                        JobTotalValue += ("Unit Price" * Quantity);

                        if FirstLineHasBeenOutput then
                            Clear(CompanyInfo.Picture);
                        FirstLineHasBeenOutput := true;
                    end;

                    trigger OnPreDataItem()
                    begin
                        CompanyInfo.CalcFields(Picture, "Logo Pie");
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    if "Job Task Type" = "Job Task Type"::"Begin-Total" then begin
                        if Indentation = 0 then
                            TotalJob := TotalLbl + ' ' + Description;
                        HeaderJobTask := PadStr('', 2 * Indentation) + Description;
                        HeaderJobTaskNo := Format("Job Task No.");
                        TotalJobTask := PadStr('', 2 * Indentation) + TotalLbl + ' ' + Description;
                    end;

                    if ((CurrentIndentation > 0) and (CurrentIndentation < Indentation)) or ("Job Task Type" = "Job Task Type"::"End-Total") then
                        NewTaskGroup := NewTaskGroup + 1;

                    CurrentIndentation := Indentation;
                end;

                trigger OnPreDataItem()
                begin
                    CompanyInfo.CalcFields(Picture, "Logo Pie");
                end;
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(JobTotalValue; Format(JobTotalValue, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Job."Currency Code")))
                {
                    // Format(TotalAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                }


            }


            trigger OnAfterGetRecord()
            begin
                JobTotalValue := 0;
                NewTaskGroup := 0;
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                Customer.Get("Bill-to Customer No.");
                FormatAddr.Customer(BillToAddr, Customer);
                VatCustomer := Customer."VAT Registration No.";
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    labels
    {
        JobNoLbl = 'Job No.';
        //  JobDescriptionLbl = 'Description';
        JobDescriptionLbl = 'Reference/PO Customer';//Referencia/PO Cliente:
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        JobsSetup.Get();

        ///
        /*
        CompanyInfo.CALCFIELDS("Logo Pie");
        CompanyInfo."Logo Pie".CREATEINSTREAM(varInStream);
        varInStream.READTEXT(legalTextTxt);
        */
        //
    end;

    trigger OnPreReport()
    begin
        JobFilter := Job.GetFilters;
        JobTaskFilter := "Job Planning Line".GetFilters;
        CompanyLogoPosition := JobsSetup."Logo Position on Documents";
    end;

    var
        VatCustomer: Text[20];
        varInStream: InStream;
        legalTextTxt: Text;

        AutoFormat: Codeunit "Auto Format";
        CompanyInfo: Record "Company Information";
        Customer: Record Customer;
        JobsSetup: Record "Jobs Setup";
        FormatAddr: Codeunit "Format Address";
        JobFilter: Text;
        JobTaskFilter: Text;
        FirstLineHasBeenOutput: Boolean;
        PrintSection: Boolean;
        CurrReportPageNoCaptionLbl: Label 'Page';
        JobQuoteCaptLbl: Label 'Job Quote';
        DescriptionCaptionLbl: Label 'Description';
        JobTaskNoCaptLbl: Label 'Job Task No.';
        //QuantityLbl: Label 'Quantity';
        QuantityLbl: Label 'Ud./Uds';
        //UnitCostLbl: Label 'Unit Cost';
        UnitCostLbl: Label 'Amount'; //Importe
        TotalJobLbl: Label 'Tax Base'; //Base Imponible
        // TotalCostLbl: Label 'Total Cost';
        TotalCostLbl: Label 'Total excluding VAT'; //Total sin IVA
        JobTaskTypeLbl: Label 'Job Task Type';
        NoLbl: Label 'No.';
        NewTaskGroup: Integer;
        CurrentIndentation: Integer;
        TotalLbl: Label 'Total';
        CompanyLogoPosition: Integer;
        JobTotalValue: Decimal;
        CompanyAddr: array[8] of Text[100];
        BillToAddr: array[8] of Text[100];
        TotalJobTask: Text[250];
        TotalJob: Text[250];
        HeaderJobTaskNo: Text[250];
        HeaderJobTask: Text[250];
        DocumentTitleLbl: Label 'Budget:';// Budget //Presupuesto
        DueDateLbl: Label 'Budget date:'; //DUE DATE Budget date //Fecha de Presupuesto:
        ExternalDocumentNoLlb: Label 'Reference/PO Pard:';//Referencia/PO Pard:
        DatosFiscalesLbl: Label 'Tax Data'; //Datos Fiscales:
        codOfertaLbl: Label 'Code Quote:'; //COD. DE OFERTA;
        SimboloEuro: Label '€';
}

