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

class MAMstatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.engage = null;
      this.done = null;
      this.error = null;
      this.inProcess = null;
      this.complete = null;
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('engage')) {
        this.engage = initObj.engage
      }
      else {
        this.engage = false;
      }
      if (initObj.hasOwnProperty('done')) {
        this.done = initObj.done
      }
      else {
        this.done = false;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = false;
      }
      if (initObj.hasOwnProperty('inProcess')) {
        this.inProcess = initObj.inProcess
      }
      else {
        this.inProcess = false;
      }
      if (initObj.hasOwnProperty('complete')) {
        this.complete = initObj.complete
      }
      else {
        this.complete = false;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MAMstatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [engage]
    bufferOffset = _serializer.bool(obj.engage, buffer, bufferOffset);
    // Serialize message field [done]
    bufferOffset = _serializer.bool(obj.done, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.bool(obj.error, buffer, bufferOffset);
    // Serialize message field [inProcess]
    bufferOffset = _serializer.bool(obj.inProcess, buffer, bufferOffset);
    // Serialize message field [complete]
    bufferOffset = _serializer.bool(obj.complete, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _serializer.float64(obj.position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MAMstatus
    let len;
    let data = new MAMstatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [engage]
    data.engage = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [done]
    data.done = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [inProcess]
    data.inProcess = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [complete]
    data.complete = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'machines/MAMstatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14b63e6a6cf35762331b707484ff880e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool engage
    bool done
    bool error
    bool inProcess
    bool complete
    float64 position
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
    const resolved = new MAMstatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.engage !== undefined) {
      resolved.engage = msg.engage;
    }
    else {
      resolved.engage = false
    }

    if (msg.done !== undefined) {
      resolved.done = msg.done;
    }
    else {
      resolved.done = false
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = false
    }

    if (msg.inProcess !== undefined) {
      resolved.inProcess = msg.inProcess;
    }
    else {
      resolved.inProcess = false
    }

    if (msg.complete !== undefined) {
      resolved.complete = msg.complete;
    }
    else {
      resolved.complete = false
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = 0.0
    }

    return resolved;
    }
};

module.exports = MAMstatus;
