namespace com.logali;

define type Name : String(50);

// type EmailsAddress_01 : array of {
//     kind  : String;
//     email : String;
// };

// type EmailsAddress_02 {
//     kind  : String;
//     email : String;
// };

// entity Emails {
//     email_01 :      EmailsAddress_01;
//     email_02 : many EmailsAddress_02;
//     email_03 : many {
//         kind  : String;
//         email : String;
//     }
// };

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
}

type Gender      : String enum {
    male;
    female;
};

entity Order {
    Clientgender : Gender;
    Status       : Integer enum {
        submitted = 1;
        fulfiller = 2;
        shipped   = 3;
        cancel    = -1;
    };
    priority     : String @assert.range enum {
        high;
        medium;
        low;
    }
}

entity Car {
    key ID                 : UUID;
        name               : String;
        virtual discount_1 : Decimal;
        @Core.Computed: false
        virtual discount_2 : Decimal;
}

type Dec         : Decimal(16, 2);

entity Products {
    key ID               : UUID;
        Name             : String not null;
        //Name             : String default 'NoName';
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        //creationDate     : Date default CURRENT_DATE;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID         : UUID;
        Name       : String;
        Street     : String;
        City       : String;
        State      : String(2);
        PostalCode : String(5);
        Country    : String(3);
        Email      : String;
        Phone      : String;
        Fax        : String;
};

entity Suppliers_01 {
    key ID      : UUID;
        Name    : type of Products : Name; //String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};

entity Suppliers_02 {
    key ID      : UUID;
        Name    : String;
        Address : {
            Street     : String;
            City       : String;
            State      : String(2);
            PostalCode : String(5);
            Country    : String(3);
        };
        Email   : String;
        Phone   : String;
        Fax     : String;
};

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesDate {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
};
