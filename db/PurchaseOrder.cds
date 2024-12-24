namespace opensap.PurchaseOrder;

    type BusinessKey : String(10);
    type SDate : DateTime;
    type CurrencyT : String(5);
    type AmountT : Decimal(15, 2);
    type QuantityT : Decimal(13, 3);
    type UnitT : String(3);
    type StatusT : String(1);

	type HistoryT {
        CREATEDBY : BusinessKey;
        CREATEDAT : Date;
        CHANGEDBY : BusinessKey;
        CHANGEDAT : Date;
    };

    entity Headers {
        key PURCHASEORDERID : Integer;
            ITEMS           : association to many Items on ITEMS.POHeader = $self;
            HISTORY         : HistoryT;
            NOTEID          : BusinessKey null;
            PARTNER         : BusinessKey;
            CURRENCY        : CurrencyT;
            GROSSAMOUNT     : AmountT;
            NETAMOUNT       : AmountT;
            TAXAMOUNT       : AmountT;
            LIFECYCLESTATUS : StatusT;
            APPROVALSTATUS  : StatusT;
            CONFIRMSTATUS   : StatusT;
            ORDERINGSTATUS  : StatusT;
            INVOICINGSTATUS : StatusT;
    }

    entity Items {
        key POHeader     : association to Headers;
        Key POItem       : Integer;
        key PRODUCT      : BusinessKey;
            NOTEID       : BusinessKey null;
            CURRENCY     : CurrencyT;
            GROSSAMOUNT  : AmountT;
            NETAMOUNT    : AmountT;
            TAXAMOUNT    : AmountT;
            QUANTITY     : QuantityT;
            QUANTITYUNIT : UnitT;
            DELIVERYDATE : Date;
    }

	define view ItemView as
        select from Items
        {
            POHeader.PURCHASEORDERID,
            POHeader.PARTNER,
            PRODUCT,
            CURRENCY,
            GROSSAMOUNT,
            NETAMOUNT,
            TAXAMOUNT,
            QUANTITY,
            QUANTITYUNIT,
            DELIVERYDATE
        };