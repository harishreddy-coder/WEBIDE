using { opensap.PurchaseOrder as db } from '../db/PurchaseOrder';


service MyService {

    entity Headers as projection on db.Headers;

    @cds.redirection.target
    entity Items as projection on db.Items;

    entity ItemView as projection on db.ItemView;

}