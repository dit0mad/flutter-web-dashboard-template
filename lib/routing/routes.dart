const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const driversPageDisplayName = "Drivers";
const driversPageRoute = "/drivers";

const clientsPageDisplayName = "Clients";
const clientsPageRoute = "/clients";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

const inventoryPageDisplayName = "Inventory";
const inventoryPageRoute = '/inventory';

const ordersPageDisplayName = "Orders";
const ordersPageRoute = "/order";

const testPageRoute = "/testPage";
const testPageDisplayName = "testPage";

const catalogPageRoute = "/catalog";
const catalogDisplayName = "Catalog";

const vendorPageRoute = "/vendor";
const vendorDisplayName = "Vendor";

const catalogMenuPageRoute = "/catalogMenu";
const catalogMenuDisplayName = "catalogMenu";

const productPageRoute = "/products";
const productDisplayName = "Products";

const cataMenuRoute = "/catalogMenuRoute";



class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(driversPageDisplayName, driversPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
  MenuItem(ordersPageDisplayName, ordersPageRoute),
  MenuItem(inventoryPageDisplayName, inventoryPageRoute),
  MenuItem(testPageDisplayName, testPageRoute),
  MenuItem(catalogDisplayName, catalogPageRoute),
];
