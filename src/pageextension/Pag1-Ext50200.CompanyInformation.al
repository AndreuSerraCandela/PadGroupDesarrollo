pageextension 51200 "CompanyInformation" extends "Company Information" //1
{
    layout
    {
        addlast(General)
        {
            /*
                        field(LogoTextPie; LogoTextPie)
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Logo Pie field.';
                            Caption = 'Texto Pie';


                            trigger OnValidate()
                            var
                            begin
                                Rec."Logo Pie".CreateOutStream(varOutStream);
                                varOutStream.WriteText(LogoTextPie);
                                Rec.Modify();
                            end;
                            }
            */

            field("Logo Pie Factura"; Rec."Logo Pie Factura")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Logo Pie Factura field.';
            }

            field(TextoPie; Rec.TextoPie)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the TextoPie field.';

            }
            field(TextoLibre; Rec.TextoLibre)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the TextoLibre field.';
            }
            field("Logo Pie"; Rec."Logo Pie")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Texto Condiciones field.';
            }


        }
    }



    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
    begin
        Rec.CalcFields("Logo Pie");
        Rec."Logo Pie".CreateInStream(varInStream);
        varInStream.ReadText(LogoTextPie);
    end;

    var
        myInt: Integer;
        varInStream: InStream;
        varOutStream: OutStream;
        LogoTextPie: Text;

}