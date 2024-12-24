using {opensap.PurchaseOrder as p} from './PurchaseOrder';


annotate p.Headers with @readonly ;
extend p.Items with @(requires : 'authenticated-user');

annotate p.ItemView with @(restrict: [
        {
        grant : 'READ',
        to : 'authenticated-user',
        where : 'CURRENCY = ''EUR'''
        }
    ]);


