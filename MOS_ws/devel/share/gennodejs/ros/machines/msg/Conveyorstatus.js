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

class Conveyorstatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.forward = null;
      this.backward = null;
      this.enable = null;
      this.error = null;
      this.ip = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('forward')) {
        this.forward = initObj.forward
      }
      else {
        this.forward = 0.0;
      }
      if (initObj.hasOwnProperty('backward')) {
        this.backward = initObj.backward
      }
      else {
        this.backward = 0.0;
      }
      if (initObj.hasOwnProperty('enable')) {
        this.enable = initObj.enable
      }
      else {
        this.enable = 0.0;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = '';
      }
      if (initObj.hasOwnProperty('ip')) {
        this.ip = initObj.ip
      }
      else {
        this.ip = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Conveyorstatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [forward]
    bufferOffset = _serializer.float64(obj.forward, buffer, bufferOffset);
    // Serialize message field [backward]
    bufferOffset = _serializer.float64(obj.backward, buffer, bufferOffset);
    // Serialize message field [enable]
    bufferOffset = _serializer.float64(obj.enable, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    // Serialize message field [ip]
    bufferOffset = _serializer.float64(obj.ip, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Conveyorstatus
    let len;
    let data = new Conveyorstatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [forward]
    data.forward = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [backward]
    data.backward = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [enable]
    data.enable = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [ip]
    data.ip = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.error.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'machines/Conveyorstatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ec79f759d0ed37cd3e5cc18185cc76f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 forward
    float64 backward
    float64 enable
    string error
    float64 ip
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
    const resolved = new Conveyorstatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.forward !== undefined) {
      resolved.forward = msg.forward;
    }
    else {
      resolved.forward = 0.0
    }

    if (msg.backward !== undefined) {
      resolved.backward = msg.backward;
    }
    else {
      resolved.backward = 0.0
    }

    if (msg.enable !== undefined) {
      resolved.enable = msg.enable;
    }
    else {
      resolved.enable = 0.0
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = ''
    }

    if (msg.ip !== undefined) {
      resolved.ip = msg.ip;
    }
    else {
      resolved.ip = 0.0
    }

    return resolved;
    }
};

module.exports = Conveyorstatus;
