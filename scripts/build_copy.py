from pathlib import Path
from gmdkit.extra.globed import GlobedScript, PREFIX
from gmdkit.models.object import ObjectList
from gmdkit.mappings import prop_id

folder = Path("lua")

object_list = ObjectList()

y = 15

for file in folder.glob("*.lua"):
  script = GlobedScript()
  script.import_script(file)
  script.prefix = f"{PREFIX}:{str(file.stem).upper()}"
  script.save()
  script.object[prop_id.y] = y = y-30
  object_list.append(script.object)

object_list.to_file("data/object_string.txt", encoded=False)
print(object_list.to_string())
