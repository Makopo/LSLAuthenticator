
## LSL Authenticator

This script is originated from the scripts I have made for [Key Card System "NoMoreOreOre"](https://marketplace.secondlife.com/p/Key-Card-System-NoMoreOreOre/446266) in 2008. This open-source set of scripts has same authentication functionalities as NoMoreOreOre without utilities.

If you have some question about this script, feel free to use `Issue` feature.

### How to Use

You'll need to create two items:

* The object which do something after authentication ("Server")
  - door
  - teleporter
  - gift giver

* The object which avatars use so that they can be authenticated ("Client")
  - token
  - dongle
  - keycard
  - HUD

#### Server

Put `server.lsl` into the object. You'll need to modify two lines.
You can use `MASTER_KEY1` for individuals/groups, `MASTER_KEY2` for systems/products.

```lsl
string MASTER_KEY1 = "INDIVIDUAL_KEY";
string MASTER_KEY2 = "SYSTEM_OR_PRODUCT_KEY";
```

Modify your door/teleporter/gift giver script to accept the linked message.
`simple_sample.lsl` has sample.

* ASK
  - send with llMessageLinked()
  - number(2nd) = 4545
  - key(4th) = UUID for the person to be authenticated

* REPLY
  - receive with link_message
  - number(2nd) = 4546
  - string(3rd) = "OK", "NG", or "timeout"

#### Client

Put `client.lsl` into the object. You'll need to modify two lines.
To be successfully authenticated, both MASTER_KEY1 and MASTER_KEY2 should have the same value as the server.

```lsl
string MASTER_KEY1 = "INDIVIDUAL_KEY";
string MASTER_KEY2 = "SYSTEM_OR_PRODUCT_KEY";
```

### Important Note

* This script can be USED in non-script-focused products.
* This script can NOT be SOLD as it is.
* This script can NOT be APPLIED to script-focused products without Mako Nozaki's approval.

### About NoMoreOreOre

[Key Card System "NoMoreOreOre"](https://marketplace.secondlife.com/p/Key-Card-System-NoMoreOreOre/446266) has various easy-to-use feature for non-programmer. If you don't get used to scripting, you might want to consider using this product.

If you have purchased NoMoreOreOre and want it to work with this open-source code, you'll need some modification. Feel free to contact to Mako Nozaki.

