# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from alma_ros_pkg/AlmaDB.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import alma_ros_pkg.msg

class AlmaDB(genpy.Message):
  _md5sum = "23813a74eebe8f35e8b0ce471b08dff6"
  _type = "alma_ros_pkg/AlmaDB"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """AlmaFmla[] entries
================================================================================
MSG: alma_ros_pkg/AlmaFmla
# Internal godel-style code for a formula, the formula itself, and whether or not it's currently trusted
int32 code
string fmla
bool trusted

"""
  __slots__ = ['entries']
  _slot_types = ['alma_ros_pkg/AlmaFmla[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       entries

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AlmaDB, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.entries is None:
        self.entries = []
    else:
      self.entries = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.entries)
      buff.write(_struct_I.pack(length))
      for val1 in self.entries:
        buff.write(_struct_i.pack(val1.code))
        _x = val1.fmla
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *_x))
        else:
          buff.write(struct.pack('<I%ss'%length, length, _x))
        buff.write(_struct_B.pack(val1.trusted))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.entries is None:
        self.entries = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.entries = []
      for i in range(0, length):
        val1 = alma_ros_pkg.msg.AlmaFmla()
        start = end
        end += 4
        (val1.code,) = _struct_i.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.fmla = str[start:end].decode('utf-8')
        else:
          val1.fmla = str[start:end]
        start = end
        end += 1
        (val1.trusted,) = _struct_B.unpack(str[start:end])
        val1.trusted = bool(val1.trusted)
        self.entries.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.entries)
      buff.write(_struct_I.pack(length))
      for val1 in self.entries:
        buff.write(_struct_i.pack(val1.code))
        _x = val1.fmla
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *_x))
        else:
          buff.write(struct.pack('<I%ss'%length, length, _x))
        buff.write(_struct_B.pack(val1.trusted))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.entries is None:
        self.entries = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.entries = []
      for i in range(0, length):
        val1 = alma_ros_pkg.msg.AlmaFmla()
        start = end
        end += 4
        (val1.code,) = _struct_i.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.fmla = str[start:end].decode('utf-8')
        else:
          val1.fmla = str[start:end]
        start = end
        end += 1
        (val1.trusted,) = _struct_B.unpack(str[start:end])
        val1.trusted = bool(val1.trusted)
        self.entries.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_i = struct.Struct("<i")
_struct_B = struct.Struct("<B")
