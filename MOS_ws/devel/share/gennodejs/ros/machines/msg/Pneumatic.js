// Auto-generated. Do not edit!

// (in-package machines.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Pneumatic {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.extended = null;
      this.retracted = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('extended')) {
        this.extended = initObj.extended
      }
      else {
        this.extended = false;
      }
      if (initObj.hasOwnProperty('retracted')) {
        this.retracted = initObj.retracted
      }
      else {
        this.retracted = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Pneumatic
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [extended]
    bufferOffset = _serializer.bool(obj.extended, buffer, bufferOffset);
    // Serialize message field [retracted]
    bufferOffset = _serializer.bool(obj.retracted, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Pneumatic
    let len;
    let data = new Pneumatic(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [extended]
    data.extended = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [retracted]
    data.retracted = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'machines/Pneumatic';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad7412a4ce4ce9d701792d492f6c3758';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool extended
    bool retracted
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Pneumatic(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.extended !== undefined) {
      resolved.extended = msg.extended;
    }
    else {
      resolved.extended = false
    }

    if (msg.retracted !== undefined) {
      resolved.retracted = msg.retracted;
    }
    else {
      resolved.retracted = false
    }

    return resolved;
    }
};

module.exports = Pneumatic;
