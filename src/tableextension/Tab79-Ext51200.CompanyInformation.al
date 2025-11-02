tableextension 51200 "CompanyInformation" extends "Company Information"//79
{
    fields
    {
        field(50100; "Logo Pie"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'Logo Pie Condiciones';
            SubType = Bitmap;
        }
        field(50101; TextoPie; Text[200])
        {
            DataClassification = ToBeClassified;

        }
        field(50102; TextoLibre; Text[200])
        {
            DataClassification = ToBeClassified;

        }
        field(50103; "Logo Pie Factura"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;

        }

    }

    var
        myInt: Integer;
}