codeunit 51200 Eventos
{
    trigger OnRun()
    begin

    end;

    procedure f_BlobGetFromFieldRef2BigText(aRecRelatedVariant: Variant; aFldRefNo: Integer; var BgText: BigText);
    var
        DataTypeMgt: Codeunit "Data Type Management";
        lRecRef: RecordRef;
        InStr: InStream;
        OutStr: OutStream;

        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        FldRef: FieldRef;
    begin
        Clear(BgText);

        //Get FieldRef to get Blob text
        if not DataTypeMgt.GetRecordRefAndFieldRef(aRecRelatedVariant, aFldRefNo, RecRef, FldRef) then
            exit;
        FldRef.CalcField();

        //Store FldRef Blob on TempBlob
        TempBlob.CreateInStream(InStr, TextEncoding::WINDOWS);
        TempBlob.FromFieldRef(FldRef);

        //Load BigText with FldRef Blob
        BgText.Read(InStr);

        exit;
    end;

    ///PARA PROYECTOS



    //PROYECTOS

    var
        myInt: Integer;
}