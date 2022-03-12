import bpy
import sys
import os
cwd = os.getcwd()

for obj in bpy.context.scene.objects:
  if obj.type == 'MESH':
    obj.select_set(True)
  else:
    obj.select_set(False)
  bpy.ops.object.delete()

bpy.ops.import_mesh.stl(filepath=cwd + "/" + sys.argv[-1])
bpy.ops.export_scene.gltf(filepath=cwd + "/" + sys.argv[-1] + ".glb")
