// Auto-generated. Do not edit!

// (in-package custom_msg2.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let KeyPoint = require('./KeyPoint.js');

//-----------------------------------------------------------

class custom_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type custom_msg
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = KeyPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type custom_msg
    let len;
    let data = new custom_msg(null);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = KeyPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 32 * object.points.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'custom_msg2/custom_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '02f30d3dee59acda5881ac1e535c914c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    custom_msg2/KeyPoint[] points
    
    ================================================================================
    MSG: custom_msg2/KeyPoint
    custom_msg2/Point2f pt
    float32 size
    float32 angle
    float32 response
    int32 octave
    int32 class_id
    int32 idKeypoint
    
    
    ================================================================================
    MSG: custom_msg2/Point2f
    float32 x
    float32 y
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new custom_msg(null);
    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = KeyPoint.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    return resolved;
    }
};

module.exports = custom_msg;
