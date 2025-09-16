from pathlib import Path
from gmdkit.extra.globed import GlobedScript
from gmdkit.models.object import ObjectList
from gmdkit.mappings import prop_id

folder = Path("lua")

object_list = ObjectList()

y = 15

for file in folder.glob("*.lua"):
  script_object = GlobedScript()
  script_object.import_script(file)
  script_object.prefix = file.stem
  script_object[prop_id.y] = y = y-30
  obj_list.append(script_object)

object_list.to_file("object_string.txt", encoded=False)
