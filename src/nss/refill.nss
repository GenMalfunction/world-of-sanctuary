void main()
{
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED) {
        DestroyObject(GetInventoryDisturbItem(), 1.0);
    } else {
        CreateItemOnObject(GetResRef(GetInventoryDisturbItem()), OBJECT_SELF, 50);
    }
}
